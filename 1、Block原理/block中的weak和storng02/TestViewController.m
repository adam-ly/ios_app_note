//
//  TestViewController.m
//  block中的weak和storng02
//
//  Created by 林域 on 2021/8/29.
//

#import "TestViewController.h"

typedef void(^Block)(void);
@interface TestViewController ()
@property(copy)NSString *str;
@property(copy)Block block;
@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    self.str = @"123";
    dispatch_time_t timer = dispatch_time(DISPATCH_TIME_NOW, 3 * NSEC_PER_SEC);
    __weak typeof(self) weakself = self;
    dispatch_after(timer, dispatch_get_main_queue(), ^{
        __strong typeof(weakself) strongself = self;
        NSLog(@"%@",strongself.str);
    });
    [self dismissViewControllerAnimated:true completion:nil];
}



@end
