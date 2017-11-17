//
//  HomeViewController.h
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



#import "HomeViewController.h"
#import "CTMediator+AddPayListActions.h"
#import "PayDataModel.h"

@interface HomeViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
//@property (nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupUI];
}


#pragma mark - 初始化UI界面
- (void)setupUI
{
    [self addNavBarItem];
    [self addTableView];
}


- (void)addNavBarItem
{
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(navAddItemEvent:)];
    
    self.navigationItem.rightBarButtonItem = item;
}


- (void)addTableView
{
    if (!self.tableView) {
        self.tableView = [[UITableView alloc] init];
    }
    
    if (![self.view isDescendantOfView:self.tableView]) {
        [self.view addSubview:self.tableView];
    }
    
    [self.tableView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.bottom.offset(0);
    }];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    self.tableView.tableFooterView = [UIView new];
    
    self.tableView.backgroundColor = [UIColor redColor];
}


#pragma mark - TableView Delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"cellID";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
        
        id dic = self.dataArray[indexPath.row];
        PayDataModel *model = [PayDataModel yy_modelWithDictionary:dic];
        
        cell.textLabel.text = [NSString stringWithFormat:@"%.2f元", model.payPrince];
        cell.detailTextLabel.text = model.payDetail;
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


#pragma mark - 初始化各种UI事件
- (void)navAddItemEvent:(id)sender
{
    UIViewController *viewController = [[CTMediator sharedInstance] mediator_AddPayListViewControllerWithParams:nil];
    viewController.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:viewController animated:YES];
}


#pragma mark - setting
//- (void)setDataArray:(NSMutableArray *)dataArray
//{
//    if (!self.dataArray) {
//        self.dataArray = [NSMutableArray array];
//    }
//
//}

@end
