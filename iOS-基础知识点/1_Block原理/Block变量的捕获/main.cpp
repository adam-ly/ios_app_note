struct __block_impl {
    void *isa;
    int Flags;
    int Reserved;
    void *FuncPtr;
};

struct __main_block_impl_0 {
    struct __block_impl impl; //
    struct __main_block_desc_0* Desc;
    int innerVariable; //局部auto变量通过值传递进来
    int *static_variable;//局部静态变量通过指针传递进来
    
    //构造方法
    __main_block_impl_0(void *fp, struct __main_block_desc_0 *desc, int _innerVariable, int *_static_variable, int flags=0) : innerVariable(_innerVariable), static_variable(_static_variable) {
        impl.isa = &_NSConcreteStackBlock; //这里编译后在栈上，但实际运行时中arc会自动copy到堆上，可以查看到打印
        impl.Flags = flags;
        impl.FuncPtr = fp;
        Desc = desc;
    }
};

static void __main_block_func_0(struct __main_block_impl_0 *__cself) {
    int innerVariable = __cself->innerVariable; // bound by copy，copy的是值
    int *static_variable = __cself->static_variable; // bound by copy，copy的是地址，所以访问的地址不变
    
    printf("%d",gloable);
    printf("%d",innerVariable);
    printf("%d",(*static_variable));
}

static struct __main_block_desc_0 {
    size_t reserved;
    size_t Block_size;
} __main_block_desc_0_DATA = { 0, sizeof(struct __main_block_impl_0)};

int gloable = 5;// 全局变量没有被捕获进去，还是全局变量

int main(int argc, const char * argv[]) {
    /* @autoreleasepool */ { __AtAutoreleasePool __autoreleasepool;
        
        int innerVariable = 1;
        static int static_variable = 3;
        
        //block的定义 可以看到auto变量是值传递，内部静态变量是指针传递，传的是地址，
        //⚠️因此：auto变量无法在block中修改他的值。
        void(*block)(void) = &__main_block_impl_0((void *)__main_block_func_0, &__main_block_desc_0_DATA, innerVariable, &static_variable));
        
        //可以看出 block是 __block_impl 类型的对象
        (__block_impl *)((__block_impl *)block)->FuncPtr)((__block_impl *)block);
    }
    return 0;
}
