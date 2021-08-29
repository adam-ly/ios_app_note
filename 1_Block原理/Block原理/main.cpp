

struct __block_impl {
  void *isa;     //isa
  int Flags;     //默认传0
  int Reserved;
  void *FuncPtr; //函数指针，指向__main_block_func_0
};

// 结构体描述
// 提供结构体__main_block_desc_0_DATA的构造方法
static struct __main_block_desc_0 {
  size_t reserved; //保留字段，没啥用
  size_t Block_size;
} __main_block_desc_0_DATA = { 0, sizeof(struct __main_block_impl_0)};


//block的结构
struct __main_block_impl_0 {
  struct __block_impl impl;
  struct __main_block_desc_0* Desc;
    
  // 构造函数
  __main_block_impl_0(void *fp, struct __main_block_desc_0 *desc, int flags=0) {
    impl.isa = &_NSConcreteStackBlock; //在栈上
    impl.Flags = flags; //默认传0
    impl.FuncPtr = fp;
    Desc = desc;
  }
};

//这里就是block的函数主体
static void __main_block_func_0(struct __main_block_impl_0 *__cself) {
    printf("a");
}


int main(int argc, const char * argv[]) {

//    void(*block)(void) = ((void (*)())&__main_block_impl_0((void *)__main_block_func_0, &__main_block_desc_0_DATA));
    
    
    void(*block)(void) = &__main_block_impl_0(__main_block_func_0, &__main_block_desc_0_DATA);

    return 0;
}
