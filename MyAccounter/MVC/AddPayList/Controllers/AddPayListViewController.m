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
#import "CTMediator+HomeActions.h"
#import "CTMediator+ChoosePayTypeActions.h"

#import "NumKeyboardView.h"
#import "PayTypeControl.h"

#import "SaveCacheManager.h"
#import "PayDataModel.h"

@interface AddPayListViewController ()<UITextFieldDelegate, NumKeyboardViewDelegate>

@property (nonatomic, strong) UITextField *priceTextField;
@property (nonatomic, strong) UITextField *detailTextField;
@property (nonatomic, strong) UILabel *timeLabel;
@property (nonatomic, strong) UIButton *sureButton;

@property (nonatomic, strong) NumKeyboardView *numKeyboardView;
@property (nonatomic, strong) PayTypeControl *payTypeControl;


@property (nonatomic, strong) PayDataModel *payDataModel;

@end

@implementation AddPayListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSNotificationCenter *defaultCenter = [NSNotificationCenter defaultCenter];
    [defaultCenter addObserver:self selector:@selector(notificateHandler:) name:NotificatePayTypeKey object:nil];
    
    [self setupUI];
}


#pragma mark - 处理Notification
- (void)notificateHandler:(NSNotification *)notificate
{
    if (self.payTypeControl
        && [notificate.object isKindOfClass:NSString.class]) {
        self.payTypeControl.descriptionLabel.text = notificate.object;
    }
}


#pragma mark - 初始化UI界面
- (void)setupUI
{
    if (!self.payDataModel) {
        self.payDataModel = [[PayDataModel alloc] init];
    }
    
    [self addTimeLabel];
    [self addPriceTextField];
    [self addDetailTextField];
    [self addSureButton];
    [self addNumKeyboardView];
    [self addPayTypeControl];
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
        make.top.offset(20);
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
    

    self.priceTextField.delegate = self;
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


- (void)addNumKeyboardView
{
    if (!self.numKeyboardView) {
        self.numKeyboardView = [[NumKeyboardView alloc] init];
    }
    
    if (![self.view isDescendantOfView:self.numKeyboardView]) {
        [self.view addSubview:self.numKeyboardView];
    }
    
    [self.numKeyboardView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.offset(0);
        make.height.mas_equalTo(200);
    }];
    
    self.numKeyboardView.delegate = self;
}


- (void)addPayTypeControl
{
    @weakify(self);
    
    if (!self.payTypeControl) {
        self.payTypeControl = [[PayTypeControl alloc] init];
    }
    
    if (![self.view isDescendantOfView:self.payTypeControl]) {
        [self.view addSubview:self.payTypeControl];
    }
    
    [self.payTypeControl mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(0);
        make.width.mas_equalTo(50);
        make.height.mas_equalTo(40);
        make.bottom.mas_equalTo(weak_self.numKeyboardView.mas_top).offset(0);
    }];
    
    
    [self.payTypeControl addTarget:self action:@selector(choosePayType:) forControlEvents:UIControlEventTouchUpInside];
}



#pragma mark - 初始化各种UI事件
- (void)saveDataEvent:(id)btn
{
    self.payDataModel.payPrince = [self.priceTextField.text doubleValue];
    self.payDataModel.payDetail = self.detailTextField.text;
//    self.payDataModel.updateDate = [NSDate date];
//    self.payDataModel.writeDate = [NSDate dateWithString:self.timeLabel.text format:@"yyyy年MM月dd日 HH:mm"];
//    self.payDataModel.payLabel = self.payTypeControl.descriptionLabel.text;
//    
//    NSInteger randNum = arc4random();
//    NSInteger timeInterval = [[NSDate date] timeIntervalSince1970];
//    
//    self.payDataModel.payID = randNum;
//    self.payDataModel.paySaveID = [[NSString stringWithFormat:@"%ld%ld",timeInterval, timeInterval] md5String];
    
    
    DLOG(self.payDataModel);
    
    SaveCacheManager *manager = [SaveCacheManager sharedSaveCacheManager];
    [manager addPayData:self.payDataModel];
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)choosePayType:(id)btn
{
    UIViewController *viewController = [[CTMediator sharedInstance] mediator_ChoosePayTypeViewControllerWithParams:nil];
    [self.navigationController pushViewController:viewController animated:YES];
}


#pragma mark - Delegate
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    return NO;
}


- (void)NumKeyboardViewClickKeyboard:(NSString *)value
{
    if ([self.priceTextField.text containsString:@"."]
        && [value containsString:@"."]) {
        return;
    }
    
    self.priceTextField.text = [self.priceTextField.text stringByAppendingString:value];
}


- (void)NumKeyboardViewClickSure
{
    [self saveDataEvent:nil];
}


- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


@end
