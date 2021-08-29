
struct __block_impl {
  void *isa;
  int Flags;
  int Reserved;
  void *FuncPtr;
};

struct __main_block_impl_0 {
  struct __block_impl impl;
  struct __main_block_desc_0* Desc;
  
  TestObj *__strong o;
  TestObj *__weak obj;
    
  __main_block_impl_0(void *fp, struct __main_block_desc_0 *desc, TestObj *__strong _o, TestObj *__weak _obj, int flags=0) : o(_o), obj(_obj) {
    impl.isa = &_NSConcreteStackBlock;
    impl.Flags = flags;
    impl.FuncPtr = fp;
    Desc = desc;
  }
};

static void __main_block_func_0(struct __main_block_impl_0 *__cself) {
    TestObj *__strong o = __cself->o; // bound by copy
    TestObj *__weak obj = __cself->obj; // bound by copy
    
    releaseObj(o);
    NSLog((NSString *)&__NSConstantStringImpl__var_folders_c4_8r5g_7xx6szc_1fms0527v480000gn_T_main_4cf01e_mi_1,obj);
}

static void __main_block_copy_0(struct __main_block_impl_0*dst, struct __main_block_impl_0*src) {_Block_object_assign((void*)&dst->o, (void*)src->o, 3/*BLOCK_FIELD_IS_OBJECT*/);_Block_object_assign((void*)&dst->obj, (void*)src->obj, 3/*BLOCK_FIELD_IS_OBJECT*/);}

static void __main_block_dispose_0(struct __main_block_impl_0*src) {_Block_object_dispose((void*)src->o, 3/*BLOCK_FIELD_IS_OBJECT*/);_Block_object_dispose((void*)src->obj, 3/*BLOCK_FIELD_IS_OBJECT*/);}

static struct __main_block_desc_0 {
  size_t reserved;
  size_t Block_size;
  void (*copy)(struct __main_block_impl_0*, struct __main_block_impl_0*);
  void (*dispose)(struct __main_block_impl_0*);
} __main_block_desc_0_DATA = { 0, sizeof(struct __main_block_impl_0), __main_block_copy_0, __main_block_dispose_0};

int main(int argc, const char * argv[]) {
    /* @autoreleasepool */ { __AtAutoreleasePool __autoreleasepool; 

        TestObj *o = ((TestObj *(*)(id, SEL))(void *)objc_msgSend)((id)objc_getClass("TestObj"), sel_registerName("new"));
        
        __attribute__((objc_ownership(weak))) TestObj *obj = o;
        
        void(*block)(void) = ((void (*)())&__main_block_impl_0((void *)__main_block_func_0, &__main_block_desc_0_DATA, o, obj, 570425344));
        
        ((void (*)(__block_impl *))((__block_impl *)block)->FuncPtr)((__block_impl *)block);
    }
    return 0;
}

void releaseObj(NSObject *o)
{
    o = __null;
    NSLog((NSString *)&__NSConstantStringImpl__var_folders_c4_8r5g_7xx6szc_1fms0527v480000gn_T_main_4cf01e_mi_2,o);
}
