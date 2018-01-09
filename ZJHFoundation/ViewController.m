//
//  ViewController.m
//  ZJHFoundation
//
//  Created by 曾俊晖 on 2018/1/9.
//  Copyright © 2018年 ZJH. All rights reserved.
//

#import "ViewController.h"
#import "ZJH_TextField.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ZJH_TextField *textField = [ZJH_TextField new];
    textField.frame = CGRectMake(40, 100, 70, 100);
    textField.isNumber = YES;
    [textField setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:textField];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
