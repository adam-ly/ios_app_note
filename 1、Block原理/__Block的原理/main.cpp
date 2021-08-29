
struct __block_impl {
    void *isa;
    int Flags;
    int Reserved;
    void *FuncPtr;
};

// 可以看到 a被包装成了一个对象
struct __Block_byref_a_0 {
    void *__isa;
    //__forwarding指针指向__Block_byref_a_0本身，如果block被copy到堆上，
    //那么栈上的block的__forwarding指向堆上的block，堆中block的__forwarding指向自己
    //⚠️为什么这么设计？
    __Block_byref_a_0 *__forwarding;
    int __flags;
    int __size;
    int a;
};

struct __main_block_impl_0 {
    struct __block_impl impl;
    struct __main_block_desc_0* Desc;
    __Block_byref_a_0 *a; // by ref
    
    __main_block_impl_0(void *fp, struct __main_block_desc_0 *desc, __Block_byref_a_0 *_a, int flags=0) : a(_a->__forwarding) {
        impl.isa = &_NSConcreteStackBlock;
        impl.Flags = flags;
        impl.FuncPtr = fp;
        Desc = desc;
    }
};

static void __main_block_func_0(struct __main_block_impl_0 *__cself) {
    __Block_byref_a_0 *a = __cself->a; // bound by ref，引用
    (a->__forwarding->a) = 5;
    printf("2a = %p\n",&(a->__forwarding->a));
}

//当block在堆上时，_Block_object_assign会对__block变量进行强引用。
static void __main_block_copy_0(struct __main_block_impl_0 *dst, struct __main_block_impl_0 *src) {_Block_object_assign((void*)&dst->a, (void*)src->a, 8/*BLOCK_FIELD_IS_BYREF*/);}

//该函数会释放掉引用的__block对象
static void __main_block_dispose_0(struct __main_block_impl_0*src) {_Block_object_dispose((void*)src->a, 8/*BLOCK_FIELD_IS_BYREF*/);}

static struct __main_block_desc_0 {
    size_t reserved;
    size_t Block_size;
    void (*copy)(struct __main_block_impl_0*, struct __main_block_impl_0*);
    //dispose函数内部会调用__main_block_dispose_0函数，该函数会释放掉引用的__block变量
    void (*dispose)(struct __main_block_impl_0*);
} __main_block_desc_0_DATA = { 0, sizeof(struct __main_block_impl_0), __main_block_copy_0, __main_block_dispose_0};

int main(int argc, const char * argv[]) {
    /* @autoreleasepool */ { __AtAutoreleasePool __autoreleasepool;
        
        __attribute__((__blocks__(byref))) __Block_byref_a_0 a = {(void*)0,(__Block_byref_a_0 *)&a, 0, sizeof(__Block_byref_a_0), 10};
        
        printf("1a = %p\n",&(a.__forwarding->a));
        
        void(*block)(void) = ((void (*)())&__main_block_impl_0((void *)__main_block_func_0, &__main_block_desc_0_DATA, (__Block_byref_a_0 *)&a, 570425344));
        
        printf("3a = %p\n",&(a.__forwarding->a));
        
        ((void (*)(__block_impl *))((__block_impl *)block)->FuncPtr)((__block_impl *)block);
        
    }
    return 0;
}
