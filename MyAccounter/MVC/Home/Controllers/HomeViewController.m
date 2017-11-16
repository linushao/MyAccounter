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

@interface HomeViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupUI];
}


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
    return 3;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"cellID";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    
    cell.textLabel.text = @"aaa";
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


#pragma mark - action
- (void)navAddItemEvent:(id)sender
{
    
}

@end
