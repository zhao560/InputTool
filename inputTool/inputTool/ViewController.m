//
//  ViewController.m
//  输入框
//
//  Created by 凉凉 on 2017/5/13.
//  Copyright © 2017年 凉凉. All rights reserved.
//

#import "ViewController.h"
#import "ZInputToolbar.h"
#import "UIView+LSExtension.h"

@interface ViewController () <ZInputToolbarDelegate>
@property (nonatomic, strong) ZInputToolbar *inputToolbar;
@property (nonatomic, strong) UIButton *btn;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.btn = [[UIButton alloc] initWithFrame:CGRectMake(10, 30, self.view.width - 20, 100)];
    [self.btn setBackgroundColor:[UIColor redColor]];
    [self.btn setTitle:@"点我" forState:UIControlStateNormal];
    [self.btn addTarget:self action:@selector(didTouchBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.btn];
    
    // 输入框
    [self setTextViewToolbar];
}

-(void)setTextViewToolbar {
    self.inputToolbar = [[ZInputToolbar alloc] initWithFrame:CGRectMake(0,self.view.height, self.view.width, 50)];
    self.inputToolbar.textViewMaxLine = 5;
    self.inputToolbar.delegate = self;
    self.inputToolbar.placeholderLabel.text = @"请输入...";
    [self.view addSubview:self.inputToolbar];
}

-(void)didTouchBtn {
    [self.inputToolbar.textInput becomeFirstResponder];
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.inputToolbar.textInput resignFirstResponder];
}

#pragma mark - ZInputToolbarDelegate
-(void)inputToolbar:(ZInputToolbar *)inputToolbar sendContent:(NSString *)sendContent {
    [self.btn setTitle:sendContent forState:UIControlStateNormal];
    // 清空输入框文字
    [self.inputToolbar sendSuccessEndEditing];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
