//
//  ViewController.m
//  block中的weak和storng02
//
//  Created by 林域 on 2021/8/29.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [self presentViewController:[NSClassFromString(@"TestViewController") new] animated:YES
                     completion:nil];
}

@end
