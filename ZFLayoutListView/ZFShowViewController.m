//
//  ZFShowViewController.m
//  ZFLayoutListView
//
//  Created by linzaifei on 2017/12/6.
//  Copyright © 2017年 linzaifei. All rights reserved.
//

#import "ZFShowViewController.h"
#import "ZFCustomTableView.h"
#import "ZFCustomTools.h"
@interface ZFShowViewController ()
@property(strong,nonatomic)ZFCustomTableView *tableView;
@end

@implementation ZFShowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    [self setUI];
    RAC(self.tableView,dataArr) = RACObserve(self,dataArr);
}

-(void)setUI{
    self.tableView = [[ZFCustomTableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [self.view addSubview:self.tableView];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
