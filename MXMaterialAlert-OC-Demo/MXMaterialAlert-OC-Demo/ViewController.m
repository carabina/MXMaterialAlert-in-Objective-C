//
//  ViewController.m
//  MXMaterialAlert-OC-Demo
//
//  Created by Meniny on 16/7/26.
//  Copyright © 2016年 Meniny. All rights reserved.
//

#import "ViewController.h"
#import "MXMaterialAlert.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [MXMaterialAlert alert:@"提示" info:@"点这里到什么地方呢？好像没出可去啊，哈哈哈哈哈哈哈😁" button:@"知道了" action:^(NSString *title, NSUInteger index) {
        [MXMaterialAlert alert:@"第二个提示" info:@"有两个按钮，恩恩" positive:@"知道了" negative:@"好吧" action:^(NSString * buttonTitle, NSUInteger buttonIndex) {
            [MXMaterialAlert alert:@"第三个提示" info:@"最多可以有无数个按钮😂\n真的！" action:nil forButtons:@"第一个按钮", @"第二个按钮", @"第三个按钮", @"第四个按钮", @"第五个按钮", @"第六个按钮", @"第七个按钮", nil];
        }];
    }];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    MXMaterialAlert *material = [MXMaterialAlert makeWithTitle:@"提示框" format:@"這是一個提示框，hahahahahha哈哈哈哈哈哈😄", arc4random_uniform(999)];
    [material addButton:@"Confirm" forType:MXMaterialAlertButtonTypeConfirm];
    
    __weak typeof(self) weakSelf = self;
    [material setOnClickListener:^(NSString *title, NSUInteger index) {
        __strong typeof(self) strongSelf = weakSelf;
        [strongSelf showConfirm];
    }];
    [material show];
}

- (void)showConfirm {
    MXMaterialAlert *material = [MXMaterialAlert makeWithTitle:@"第二個提示框" format:@"随机数 ：%zd\n撒打算几点了空间啊是快乐撒娇的卡拉是好多了撒娇奥斯卡了经典安老师看见的lksjadjklasjdaskljdlaks21478rgoyUBOYF*&D(TCROYGVUBHGOTFCGV", arc4random_uniform(999)];
    [material addButton:@"Cancel" forType:MXMaterialAlertButtonTypeCancel];
    [material addButton:@"Confirm" forType:MXMaterialAlertButtonTypeConfirm];
    
    __weak typeof(self) weakSelf = self;
    [material setOnClickListener:^(NSString *title, NSUInteger index) {
        __strong typeof(self) strongSelf = weakSelf;
        if (index) {
            [strongSelf showOptions];
        }
    }];
    [material show];
}

- (void)showOptions {
    MXMaterialAlert *material = [MXMaterialAlert makeWithTitle:@"另一個提示框" format:@"另一個提示框哦\n真的是另一個提示框。沒有騙你。%zd", arc4random_uniform(999)];
    [material addButton:@"Show Detail" forType:MXMaterialAlertButtonTypeCustom];
    [material addButton:@"Show Detail" forType:MXMaterialAlertButtonTypeCustom];
    [material addButton:@"Show Detail" forType:MXMaterialAlertButtonTypeCustom];
    //    [material addButton:@"Confirm" forType:MXMaterialAlertButtonTypeConfirm];
    [material addButton:@"Cancel" forType:MXMaterialAlertButtonTypeCancel];
    [material show];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
