#pragma mark - 代码编译后的autoreleasepool
struct __AtAutoreleasePool {
    //构造函数
  __AtAutoreleasePool() {atautoreleasepoolobj = objc_autoreleasePoolPush();}
    //析构函数
  ~__AtAutoreleasePool() {objc_autoreleasePoolPop(atautoreleasepoolobj);}
  void * atautoreleasepoolobj;
};

int main(int argc, const char * argv[]) {
    /* @autoreleasepool */
    {
        __AtAutoreleasePool __autoreleasepool;
//        NSLog((NSString *)&__NSConstantStringImpl__var_folders_py_lnh5p4gx7gz03z73frpv5m6m0000gn_T_main_e6bba4_mi_0);
    }
    return 0;
}

//⚠️⚠️⚠️主线程以及非显式创建的线程（比如 GCD）都会有一个 event loop (RunLoop 就是具体实现)，在 loop 的每一个循环周期的开始和结束会分别调用自动释放池的 push 和 pop 方法，由此来实现自动的内存管理。⚠️⚠️⚠️

//1、objc_autoreleasePoolPush 和 objc_autoreleasePoolPop 实际上会调用AutoreleasePoolPage的push和pop方法
void * objc_autoreleasePoolPush(void) { return AutoreleasePoolPage::push(); }
void objc_autoreleasePoolPop(void *ctxt) { AutoreleasePoolPage::pop(ctxt); }

#pragma mark - 1、AutoreleasePage
//2、那么我们先看下AutoreleasePoolPage的大致结构
class AutoreleasePoolPage {
    ...
    magic_t const magic;//用于校验内存是否损坏。
    id *next; //指向当前可插入对象的地址
    pthread_t const thread;//当前对应线程
    //前驱和后继指针，自动释放池就是一个以AutoreleasePoolPage为节点的双向链表
    AutoreleasePoolPage * const parent;
    AutoreleasePoolPage *child;

    static void * operator new(size_t size) {
        /*这个方法以alignment对齐的地址分配size的内存空间。调用时两个参数都使用了SIZE宏，
         实际上就是虚拟内存页的大小 - 4096。 */
        return malloc_zone_memalign(malloc_default_zone(), SIZE, SIZE);
        /*
         ⚠️注:为什么是4096,这个大小是经过考究的,
         1、page空间过小会产生较多的节点,大量的parent/child指针也会占用可观的内存
         2、page过大会导致一个page的利用率低,也会浪费内存,
         3、在保证内存对齐的情况下最大化利用空间避免内存碎片
         */
    }
    
//    AutoreleasePoolPage本身的大小远不及4096，而超出的空间正是用来存放“期望被自动管理的对象”。
//    begin()和end()方法标记了这个范围。
    id * begin() {
        //自己的开始地址+自己的占用空间大小就是下一个对象的开始地址
        return (id *) ((uint8_t *)this+sizeof(*this));
    }
    id * end() {
        //自己的开始地址+虚拟内存的大小4096就是最高地址,
        return (id *) ((uint8_t *)this+SIZE);
    }
    
    bool empty() { //next指针的地址等于自己的开始地址 说明没有添加过任何对象
        return next == begin();
    }

    bool full() { //next指针的地址等于自己的开始地址加4096 说明到这一页满了
        return next == end();
    }
    ...
}


#pragma mark - 2、push函数
static inline void *push()
{
    id *dest;
    // ⚠️POOL_BOUNDARY 定义为nil
    dest = autoreleaseFast(POOL_BOUNDARY);
    return dest;
}

static inline id *autoreleaseFast(id obj)
{
    //hotpage指当前使用的page(未满)
    AutoreleasePoolPage *page = hotPage();
    if (page && !page->full()) {
        return page->add(obj); //存在没有满的page
    } else if (page) {
        return autoreleaseFullPage(obj, page); //满了
    } else {
        return autoreleaseNoPage(obj);//没有page
    }
}

//存在没有满的page 那么直接添加obj
id *add(id obj)
{
    assert(!full());
    unprotect();//该功能目前没开放,作用是保证page的写安全
    //⚠️ faster than `return next-1` because of aliasing
    id *ret = next; // 直接返回next,代表添加obj后偏移到obj所在的地址
    *next++ = obj; // *next是指向next指针的指针,也就是存放着next指针的地址,通过++就移到下一个地址,这里是指向obj后再执行++操作,说明每次插入对象之前,先插入一个nil作为哨兵,作用是为了pop的时候遇到nil就停止
    protect();//该功能目前没开放,作用是保证page的写安全
    return ret;
}

//当前的page满了,那么创建一个新的page并添加obj
static __attribute__((noinline))
id *autoreleaseFullPage(id obj, AutoreleasePoolPage *page)
{   ...
    do {//找到没满的page,找不到就创建一个新的page
        if (page->child) page = page->child;
        else page = new AutoreleasePoolPage(page);
    } while (page->full());
    
    //标记为当前可插入对象的page
    setHotPage(page);
    //添加obj
    return page->add(obj);
}

//没有page,创建新page并添加obj
static __attribute__((noinline))
id *autoreleaseNoPage(id obj)
{
    ...
    
    AutoreleasePoolPage *page = new AutoreleasePoolPage(nil);
    setHotPage(page);
    
    ...
    return page->add(obj);
}

#pragma mark - 3、hotPage & coldPage -

// hotPage 指当前使用的 AutoreleasePoolPage 节点，coldPage 指已经被装满的链表节点。

static inline AutoreleasePoolPage *hotPage()
{
    AutoreleasePoolPage *result = (AutoreleasePoolPage *)
    tls_get_direct(key);
    // EMPTY_POOL_PLACEHOLDER 表示没有 page
    if ((id *)result == EMPTY_POOL_PLACEHOLDER) return nil;
    if (result) result->fastcheck();
    return result;
}
static inline void setHotPage(AutoreleasePoolPage *page)
{
    if (page) page->fastcheck();
    tls_set_direct(key, (void *)page);
}

/*
 tls_get_direct 和 tls_set_direct 两个函数中调用 pthread 的 _pthread_getspecific_direct 和 _pthread_setspecific_direct
 TLS: Thread Local Storage
 作用:⚠️⚠️利用当前线程的局部存储将page存储起来,这样可以避免维护额外的空间来记录尾部的page,也由此验证了自动释放吃与线程一一对应的关系
 */



#pragma mark - 4、POOL_BOUNDARY -
//1、POOL_BOUNDARY用来区分不同的自动释放池，以解决自动释放池嵌套的问题；
//2、每当创建一个自动释放池，就会调用push()方法将一个POOL_BOUNDARY入栈，并返回其存放的内存地址；
//3、当往自动释放池中添加autorelease对象时，将autorelease对象的内存地址入栈，它们前面至少有一个POOL_BOUNDARY；
//4、当销毁一个自动释放池时，会调用pop方法并传入一个POOL_BOUNDARY，会从自动释放池中最后一个对象开始，依次给它们发送release消息，直到遇到这个POOL_BOUNDARY。
static inline id autorelease(id obj)
{
    ...
    //可以看出还是调用autoreleaseFast进行page->add(POOL_BOUNDARY)
    id *dest __unused = autoreleaseFast(obj)
    return obj;
}

#pragma mark - 5、pop函数 -
static inline void pop(void *token)
{
    AutoreleasePoolPage *page;
    id *stop;
    ...
    
    page = pageForPointer(token);
    stop = (id *)token; //pop接受的是push(),push返回的是add(),add返回的是POOL_BOUNDARY
    ...

    if (PrintPoolHiwat) printHiwat();

    // 释放直到遇见POOL_BOUNDARY
    page->releaseUntil(stop);

    // memory: delete empty children 删除空的children,并把hotPage指给父节点
    if (DebugPoolAllocation  &&  page->empty()) {
        // special case: delete everything during page-per-pool debugging
        AutoreleasePoolPage *parent = page->parent;
        page->kill();
        setHotPage(parent);
    } else if (DebugMissingPools  &&  page->empty()  &&  !page->parent) {
        // special case: delete everything for pop(top)
        // when debugging missing autorelease pools
        page->kill();
        setHotPage(nil); //全部节点都释放掉
    }
    else if (page->child) {
        // hysteresis: keep one empty child if page is more than half full
        if (page->lessThanHalfFull()) {
            page->child->kill();
        }
        else if (page->child->child) {
            page->child->child->kill();
        }
    }
}

static AutoreleasePoolPage *pageForPointer(const void *p) {
    //p是指向stop指针的指针 也就是存放着stop指针的地址
    return pageForPointer((uintptr_t)p);
}
static AutoreleasePoolPage *pageForPointer(uintptr_t p) {
    AutoreleasePoolPage *result;
    uintptr_t offset = p % SIZE;//size是4096,由于内存对齐每一页都是4096,那么通过p%size就可以得到当前page的偏移量ofsset,也就是page的起始+page的实际大小
    ....
    // 再通过p-offset便得出page的起始地址
    result = (AutoreleasePoolPage *)(p - offset);
    result->fastcheck();
    return result;
}


//释放
void releaseUntil(id *stop)
{
    // Not recursive: we don't want to blow out the stack
    // if a thread accumulates a stupendous amount of garbage
    while (this->next != stop) {
        // Restart from hotPage() every time, in case -release
        // autoreleased more objects
        AutoreleasePoolPage *page = hotPage();
        
        // fixme I think this `while` can be `if`, but I can't prove it
        while (page->empty()) {
            page = page->parent;
            setHotPage(page);
        }
        
        id obj = *--page->next;
        memset((void*)page->next, SCRIBBLE, sizeof(*page->next));
        
        if (obj != POOL_BOUNDARY) {
            objc_release(obj);
        }
    }
    setHotPage(this);
}

///清除掉child
void kill()
{
    // Not recursive: we don't want to blow out the stack
    // if a thread accumulates a stupendous amount of garbage
    AutoreleasePoolPage *page = this;
    while (page->child) page = page->child;

    AutoreleasePoolPage *deathptr;
    do {
        deathptr = page;
        page = page->parent;
        if (page) {
            page->child = nil;
        }
        delete deathptr;
    } while (deathptr != this);
}

#pragma mark - 自动释放池总结 -
1、将需要释放的对象添加到当前使用的page(hotpage)中,如果page满了它的child就指向下一个新的page,并设置为新的hotpage,
2、在每次插入新的对象之前,先插入一个哨兵对象POOL_BOUNDARY(nil)作为pop操作的停止边界,再继续插入要释放的对象
3、调用POP释放对象,通过page->releaseUntil(stop)逐个释放对象,直到遇见POOL_BOUNDARY就停止释放

注释:释放是指给需要管理的对象发送release消息.
