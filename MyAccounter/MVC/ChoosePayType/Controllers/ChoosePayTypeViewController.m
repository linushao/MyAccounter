//
//  ChoosePayTypeViewController.h
//  Created by acewei on 2017/11/20.
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



#import "ChoosePayTypeViewController.h"
#import <YYModel.h>

//#import "CTMediator+<#ActionName#>Actions.h"

#import "PayTypeListView.h"

@interface ChoosePayTypeViewController ()<PayTypeListViewDelegate>

//@property (nonatomic, strong) <#UIClass#> *<#object#>;

@property (nonatomic, strong) PayTypeListView *listView;
@property (nonatomic, strong) UIButton *sureButton;

@end

@implementation ChoosePayTypeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"类目";
	
	[self setupUI];
}


#pragma mark - 初始化UI界面
- (void)setupUI
{
    [self addListView];
    [self addSureButton];
}


- (void)addListView
{
    @weakify(self);
    
    if (!self.listView) {
        self.listView = [[PayTypeListView alloc] init];
    }
    
    if (![self.view isDescendantOfView:self.listView]) {
        [self.view addSubview:self.listView];
    }
    
    [self.listView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.offset(0);
        make.height.mas_equalTo(weak_self.view.size.width/6*3 + 30);
    }];
    
    
    self.listView.delegate = self;
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
        make.left.right.bottom.offset(0);
        make.height.mas_equalTo(50);
    }];
    
    self.sureButton.backgroundColor = [UIColor colorWithRGB:0x00A5FA];
    [self.sureButton setTitle:@"完成" forState:UIControlStateNormal];
    [self.sureButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    [self.sureButton addTarget:self action:@selector(sureButtonEvent:) forControlEvents:UIControlEventTouchUpInside];
}


#pragma mark - 初始化各种UI事件
- (void)sureButtonEvent:(id)btn
{
    [self.navigationController popViewControllerAnimated:YES];
    
    DLOG(@(self.listView.payTypeIndex));
    
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center postNotificationOnMainThreadWithName:NotificatePayTypeKey object:self.listView.payType];
}


#pragma mark - PayTypeListView Delegate
- (void)PayTypeListViewClick:(UIButton *)btn
                       index:(NSInteger)index
{
    
}

@end
