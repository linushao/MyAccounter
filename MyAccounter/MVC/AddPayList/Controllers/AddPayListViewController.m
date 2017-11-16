//
//  AddPayListViewController.h
//  Created by acewei on 2017/11/16.
//  Copyright © 2017年 acewei. All rights reserved.
//


/**
    用法：
    用NSDictionary传递参数
    1、#import "CTMediator+NextModuleActions.h"（引入下一个模块的action）

    2、
    UIViewController *viewController = [[CTMediator sharedInstance] mediator_NextModuleViewControllerWithParams:@{@"model":@"123456"}];
    [self.navigationController pushViewController:viewController animated:YES];
*/



#import "AddPayListViewController.h"
#import <YYCategories.h>
#import <YYCache.h>

#import "PayListKeyHeader.h"

@interface AddPayListViewController ()

@property (nonatomic, strong) UITextField *priceTextField;
@property (nonatomic, strong) UITextField *detailTextField;
@property (nonatomic, strong) UILabel *timeLabel;
@property (nonatomic, strong) UIButton *sureButton;

@end

@implementation AddPayListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setupUI];
}


#pragma mark - 初始化UI界面
- (void)setupUI
{
    [self addTimeLabel];
    [self addPriceTextField];
    [self addDetailTextField];
    [self addSureButton];
}

- (void)addTimeLabel
{
    if (!self.timeLabel) {
        self.timeLabel = [[UILabel alloc] init];
    }
    
    if (![self.view isDescendantOfView:self.timeLabel]) {
        [self.view addSubview:self.timeLabel];
    }
    
    [self.timeLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.right.offset(0);
        make.top.offset(80);
    }];
    
    self.timeLabel.textAlignment = NSTextAlignmentCenter;
    
    self.timeLabel.text = [[NSDate date] stringWithFormat:@"yyyy年MM月dd日 HH:mm"];
    
}

- (void)addPriceTextField
{
    if (!self.priceTextField) {
        self.priceTextField = [[UITextField alloc] init];
    }
    
    if (![self.view isDescendantOfView:self.priceTextField]) {
        [self.view addSubview:self.priceTextField];
    }
    
    [self.priceTextField mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(10);
        make.right.offset(-10);
        make.top.mas_equalTo(self.timeLabel.mas_bottom).offset(20);
    }];
    
    self.priceTextField.borderStyle = UITextBorderStyleRoundedRect;
    
    self.priceTextField.placeholder = @"价格";
    
    self.priceTextField.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
}

- (void)addDetailTextField
{
    if (!self.detailTextField) {
        self.detailTextField = [[UITextField alloc] init];
    }
    
    if (![self.view isDescendantOfView:self.detailTextField]) {
        [self.view addSubview:self.detailTextField];
    }
    
    [self.detailTextField mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(10);
        make.right.offset(-10);
        make.top.mas_equalTo(self.priceTextField.mas_bottom).offset(30);
    }];
    
    
    self.detailTextField.borderStyle = UITextBorderStyleRoundedRect;
    
    self.detailTextField.placeholder = @"详情";
    
    self.detailTextField.keyboardType = UIKeyboardTypeDefault;
}

- (void)addSureButton
{
    if (!self.sureButton) {
        self.sureButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    }
    
    if (![self.view isDescendantOfView:self.sureButton]) {
        [self.view addSubview:self.sureButton];
    }
    
    [self.sureButton mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(20);
        make.right.offset(-20);
        make.top.mas_equalTo(self.detailTextField.mas_bottom).offset(20);
        make.height.mas_equalTo(30);
    }];
    
    
    self.sureButton.backgroundColor = [UIColor redColor];
    [self.sureButton setTitle:@"确定" forState:UIControlStateNormal];
    
    
    [self.sureButton addTarget:self action:@selector(saveDataEvent:) forControlEvents:UIControlEventTouchUpInside];
}



#pragma mark - 初始化各种UI事件
- (void)saveDataEvent:(id)btn
{
}


@end
