
struct __block_impl {
    void *isa;
    int Flags;
    int Reserved;
    void *FuncPtr;
};

struct __main_block_impl_0 {
    struct __block_impl impl;
    struct __main_block_desc_0* Desc;
   
    TestObj *__strong obj1; //可以看到，拷贝的属性修饰符也会一致带过来
    TestObj *__weak obj2; //可以看到，拷贝的属性修饰符也会一致带过来
    
    __main_block_impl_0(void *fp, struct __main_block_desc_0 *desc, TestObj *__strong _obj1, TestObj *__weak _obj2, int flags=0) : obj1(_obj1), obj2(_obj2) {
        impl.isa = &_NSConcreteStackBlock;
        impl.Flags = flags;
        impl.FuncPtr = fp;
        Desc = desc;
    }
};

static void __main_block_func_0(struct __main_block_impl_0 *__cself) {
    TestObj *__strong obj1 = __cself->obj1; // bound by copy
    TestObj *__weak obj2 = __cself->obj2; // bound by copy
    
    printf("obj1 = %@",obj1);
    printf("obj2 = %@",obj2);
}

static void __main_block_copy_0(struct __main_block_impl_0*dst, struct __main_block_impl_0*src) {_Block_object_assign((void*)&dst->obj1, (void*)src->obj1, 3/*BLOCK_FIELD_IS_OBJECT*/);_Block_object_assign((void*)&dst->obj2, (void*)src->obj2, 3/*BLOCK_FIELD_IS_OBJECT*/);}

static void __main_block_dispose_0(struct __main_block_impl_0*src) {_Block_object_dispose((void*)src->obj1, 3/*BLOCK_FIELD_IS_OBJECT*/);_Block_object_dispose((void*)src->obj2, 3/*BLOCK_FIELD_IS_OBJECT*/);}

static struct __main_block_desc_0 {
    size_t reserved;
    size_t Block_size;
    void (*copy)(struct __main_block_impl_0*, struct __main_block_impl_0*);
    void (*dispose)(struct __main_block_impl_0*);
} __main_block_desc_0_DATA = { 0, sizeof(struct __main_block_impl_0), __main_block_copy_0, __main_block_dispose_0};

int main(int argc, const char * argv[]) {
    /* @autoreleasepool */ { __AtAutoreleasePool __autoreleasepool;
        
        __attribute__((objc_ownership(strong))) TestObj *obj1 = ((TestObj *(*)(id, SEL))(void *)objc_msgSend)((id)objc_getClass("TestObj"), sel_registerName("new"));
        
        __attribute__((objc_ownership(strong))) TestObj *o = ((TestObj *(*)(id, SEL))(void *)objc_msgSend)((id)objc_getClass("TestObj"), sel_registerName("new"));
        
        __attribute__((objc_ownership(weak))) TestObj *obj2 = o;
        
        //传的是对象的地址，即指针obj1和obj2
        void(*block)(void) = ((void (*)())&__main_block_impl_0((void *)__main_block_func_0, &__main_block_desc_0_DATA, obj1, obj2, 570425344));
        
        
    }
    return 0;
}
static struct IMAGE_INFO { unsigned version; unsigned flag; } _OBJC_IMAGE_INFO = { 0, 2 };
