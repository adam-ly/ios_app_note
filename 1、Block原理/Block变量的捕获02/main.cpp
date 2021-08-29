
struct __block_impl {
    void *isa;
    int Flags;
    int Reserved;
    void *FuncPtr;
};

struct __main_block_impl_0 {
    struct __block_impl impl;
    struct __main_block_desc_0* Desc;
    NSArray<NSNumber *> *array; //
    NSString **str;
    __main_block_impl_0(void *fp, struct __main_block_desc_0 *desc, NSArray<NSNumber *> *_array, NSString **_str, int flags=0) : array(_array), str(_str) {
        impl.isa = &_NSConcreteStackBlock;
        impl.Flags = flags;
        impl.FuncPtr = fp;
        Desc = desc;
    }
};
static void __main_block_func_0(struct __main_block_impl_0 *__cself) {
    
    NSArray<NSNumber *> *array = __cself->array; // bound by copy
    
    NSString **str = __cself->str; // bound by copy
    
    printf("1、array指向的地址 - %p array本身的地址 - %p \n",array,&array);
        
    (*str) = (NSString *)&__NSConstantStringImpl__var_folders_c4_8r5g_7xx6szc_1fms0527v480000gn_T_main_c06778_mi_1;
}

static void __main_block_copy_0(struct __main_block_impl_0*dst, struct __main_block_impl_0*src) {_Block_object_assign((void*)&dst->array, (void*)src->array, 3/*BLOCK_FIELD_IS_OBJECT*/);_Block_object_assign((void*)&dst->str, (void*)src->str, 3/*BLOCK_FIELD_IS_OBJECT*/);}

static void __main_block_dispose_0(struct __main_block_impl_0*src) {_Block_object_dispose((void*)src->array, 3/*BLOCK_FIELD_IS_OBJECT*/);_Block_object_dispose((void*)src->str, 3/*BLOCK_FIELD_IS_OBJECT*/);}

static struct __main_block_desc_0 {
    size_t reserved;
    size_t Block_size;
    void (*copy)(struct __main_block_impl_0*, struct __main_block_impl_0*);
    void (*dispose)(struct __main_block_impl_0*);
} __main_block_desc_0_DATA = { 0, sizeof(struct __main_block_impl_0), __main_block_copy_0, __main_block_dispose_0};

int main(int argc, const char * argv[]) {
    /* @autoreleasepool */ { __AtAutoreleasePool __autoreleasepool;
                
        NSArray<NSNumber *> *array = ((NSMutableArray * _Nonnull (*)(id, SEL))(void *)objc_msgSend)((id)objc_getClass("NSMutableArray"), sel_registerName("array"));
        
        static NSString* str = (NSString *)&__NSConstantStringImpl__var_folders_c4_8r5g_7xx6szc_1fms0527v480000gn_T_main_c06778_mi_0;
        
        //⚠️注意auto的array传的是指针，即它指向的对象。而static的str传的是str的地址，即str本身。
        void(*block)(void) = ((void (*)())&__main_block_impl_0((void *)__main_block_func_0, &__main_block_desc_0_DATA, array, &str, 570425344));
        
        ((void (*)(__block_impl *))((__block_impl *)block)->FuncPtr)((__block_impl *)block);
        
        
    }
    return 0;
}
static struct IMAGE_INFO { unsigned version; unsigned flag; } _OBJC_IMAGE_INFO = { 0, 2 };
