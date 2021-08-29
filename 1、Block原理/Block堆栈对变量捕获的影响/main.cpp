
struct __block_impl {
    void *isa;
    int Flags;
    int Reserved;
    void *FuncPtr;
};

int gloable = 5;

#pragma mark - block1 __NSGlobalBlock__ -
struct __main_block_impl_0 {
    struct __block_impl impl;
    struct __main_block_desc_0* Desc;
    
    __main_block_impl_0(void *fp, struct __main_block_desc_0 *desc, int flags=0) {
        impl.isa = &_NSConcreteStackBlock;
        impl.Flags = flags;
        impl.FuncPtr = fp;
        Desc = desc;
    }
};
static void __main_block_func_0(struct __main_block_impl_0 *__cself) {
    
    NSLog((NSString *)&__NSConstantStringImpl__var_folders_c4_8r5g_7xx6szc_1fms0527v480000gn_T_main_46e938_mi_0);
}

static struct __main_block_desc_0 {
    size_t reserved;
    size_t Block_size;
} __main_block_desc_0_DATA = { 0, sizeof(struct __main_block_impl_0)};


#pragma mark - block2 __NSStackBlock__ -
struct __main_block_impl_1 {
    struct __block_impl impl;
    struct __main_block_desc_1* Desc;
    int age;
    __main_block_impl_1(void *fp, struct __main_block_desc_1 *desc, int _age, int flags=0) : age(_age) {
        impl.isa = &_NSConcreteStackBlock;
        impl.Flags = flags;
        impl.FuncPtr = fp;
        Desc = desc;
    }
};
static void __main_block_func_1(struct __main_block_impl_1 *__cself) {
    int age = __cself->age; // bound by copy
    
    NSLog((NSString *)&__NSConstantStringImpl__var_folders_c4_8r5g_7xx6szc_1fms0527v480000gn_T_main_46e938_mi_1);
    NSLog((NSString *)&__NSConstantStringImpl__var_folders_c4_8r5g_7xx6szc_1fms0527v480000gn_T_main_46e938_mi_2,age);
}

static struct __main_block_desc_1 {
    size_t reserved;
    size_t Block_size;
} __main_block_desc_1_DATA = { 0, sizeof(struct __main_block_impl_1)};


#pragma mark - block3 __NSMallocBlock__ -
struct __main_block_impl_2 {
    struct __block_impl impl;
    struct __main_block_desc_2* Desc;
    int age;
    __main_block_impl_2(void *fp, struct __main_block_desc_2 *desc, int _age, int flags=0) : age(_age) {
        impl.isa = &_NSConcreteStackBlock;
        impl.Flags = flags;
        impl.FuncPtr = fp;
        Desc = desc;
    }
};
static void __main_block_func_2(struct __main_block_impl_2 *__cself) {
    int age = __cself->age; // bound by copy
    
    NSLog((NSString *)&__NSConstantStringImpl__var_folders_c4_8r5g_7xx6szc_1fms0527v480000gn_T_main_46e938_mi_3);
    NSLog((NSString *)&__NSConstantStringImpl__var_folders_c4_8r5g_7xx6szc_1fms0527v480000gn_T_main_46e938_mi_4,age);
}

static struct __main_block_desc_2 {
    size_t reserved;
    size_t Block_size;
} __main_block_desc_2_DATA = { 0, sizeof(struct __main_block_impl_2)};


int main(int argc, const char * argv[]) {
    
    /* @autoreleasepool */ { __AtAutoreleasePool __autoreleasepool;
        
        void (*block1)(void) = ((void (*)())&__main_block_impl_0((void *)__main_block_func_0, &__main_block_desc_0_DATA));
        
        int age = 10;
        void (*block2)(void) = ((void (*)())&__main_block_impl_1((void *)__main_block_func_1, &__main_block_desc_1_DATA, age));
        
        void (*block3)(void) = (void (*)())((id (*)(id, SEL))(void *)objc_msgSend)((id)((void (*)())&__main_block_impl_2((void *)__main_block_func_2, &__main_block_desc_2_DATA, age)), sel_registerName("copy"));
        
        NSLog((NSString *)&__NSConstantStringImpl__var_folders_c4_8r5g_7xx6szc_1fms0527v480000gn_T_main_46e938_mi_5,((Class (*)(id, SEL))(void *)objc_msgSend)((id)block1, sel_registerName("class")),((Class (*)(id, SEL))(void *)objc_msgSend)((id)block2, sel_registerName("class")),((Class (*)(id, SEL))(void *)objc_msgSend)((id)block3, sel_registerName("class")));
    }
    return 0;
}
static struct IMAGE_INFO { unsigned version; unsigned flag; } _OBJC_IMAGE_INFO = { 0, 2 };
