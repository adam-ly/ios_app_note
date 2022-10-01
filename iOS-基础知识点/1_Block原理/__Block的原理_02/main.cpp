
struct __block_impl {
    void *isa;
    int Flags;
    int Reserved;
    void *FuncPtr;
};

struct __Block_byref_a_0 {
    void *__isa;
    __Block_byref_a_0 *__forwarding;
    int __flags;
    int __size;
    int *a; //保存的是地址
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
    __Block_byref_a_0 *a = __cself->a; // bound by ref
    
    int c = 20;//栈区
    (a->__forwarding->a) = &c;
    
    //注意。这里打印的是C的值了
    NSLog((NSString *)&__NSConstantStringImpl__var_folders_c4_8r5g_7xx6szc_1fms0527v480000gn_T_main_043586_mi_1,*(a->__forwarding->a),(a->__forwarding->a));
}

static void __main_block_copy_0(struct __main_block_impl_0*dst, struct __main_block_impl_0*src) {_Block_object_assign((void*)&dst->a, (void*)src->a, 8/*BLOCK_FIELD_IS_BYREF*/);}

static void __main_block_dispose_0(struct __main_block_impl_0*src) {_Block_object_dispose((void*)src->a, 8/*BLOCK_FIELD_IS_BYREF*/);}

static struct __main_block_desc_0 {
    size_t reserved;
    size_t Block_size;
    void (*copy)(struct __main_block_impl_0*, struct __main_block_impl_0*);
    void (*dispose)(struct __main_block_impl_0*);
} __main_block_desc_0_DATA = { 0, sizeof(struct __main_block_impl_0), __main_block_copy_0, __main_block_dispose_0};

int main(int argc, const char * argv[]) {
    /* @autoreleasepool */ { __AtAutoreleasePool __autoreleasepool;
        
        int b = 10;
        
        //传入&a给 __forwarding,可以看出__forwarding指向的是(__Block_byref_a_0 *)a 本身。
        //传入b的地址给int *a.
        __attribute__((__blocks__(byref))) __Block_byref_a_0 a = {(void*)0,(__Block_byref_a_0 *)&a, 0, sizeof(__Block_byref_a_0), &b};
        
        // 这里打印的是 __forwarding中的a，即b。
        NSLog((NSString *)&__NSConstantStringImpl__var_folders_c4_8r5g_7xx6szc_1fms0527v480000gn_T_main_043586_mi_0,*(a.__forwarding->a),(a.__forwarding->a));
        
        //
        void(*block)(void) = ((void (*)())&__main_block_impl_0((void *)__main_block_func_0, &__main_block_desc_0_DATA, (__Block_byref_a_0 *)&a, 570425344));
        
        // 这里打印的是 __forwarding中的a，即b。
        NSLog((NSString *)&__NSConstantStringImpl__var_folders_c4_8r5g_7xx6szc_1fms0527v480000gn_T_main_043586_mi_2,*(a.__forwarding->a),(a.__forwarding->a));
        
        ((void (*)(__block_impl *))((__block_impl *)block)->FuncPtr)((__block_impl *)block);
    }
    return 0;
}
