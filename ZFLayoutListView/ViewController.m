//
//  ViewController.m
//  ZFLayoutListView
//
//  Created by linzaifei on 2017/12/6.
//  Copyright © 2017年 linzaifei. All rights reserved.
//

#import "ViewController.h"
#import "ZFCumtomView.h"
#import "ZFConfig.h"
#import "ZFCustomTableView.h"
#import "ZFShowViewController.h"
#import "ZFCustomTools.h"
#import "ZFWriteViewController.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   /*
    ZFCumtomView *c = [[ZFCumtomView alloc] initWithFrame:CGRectMake(0, 100,kScreenWidth , 30)];
    c.placeholder = @"这是我的第一次测试";
    c.textColor = [UIColor redColor];
    c.canEdit = YES;
    c.canNeed = YES;
    c.title = @"测试1";
    c.item.canTag = YES;
    c.item.image = [UIImage imageNamed:@"mediate_help"];
    c.keyboardType = UIKeyboardTypeNumberPad;
    [self.view addSubview:c];
    */
//    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.arr.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class])];
    cell.textLabel.text = self.arr[indexPath.row];
    cell.textLabel.font = [UIFont systemFontOfSize:15];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if(indexPath.row == 12){
        ZFWriteViewController *showVC = [[ZFWriteViewController alloc] init];
        showVC.title = self.arr[indexPath.row];
        showVC.dataArr = [ZFCustomTools zf_getDataWithPlist:self.plistArr[indexPath.row]];
        [self.navigationController pushViewController:showVC animated:YES];
    }else{
        ZFShowViewController *showVC = [[ZFShowViewController alloc] init];
        showVC.title = self.arr[indexPath.row];
        showVC.dataArr = [ZFCustomTools zf_getDataWithPlist:self.plistArr[indexPath.row]];
        [self.navigationController pushViewController:showVC animated:YES];
    }
}

-(NSArray *)arr{
    return @[@"不分组没有图片不加tag",@"不分组有图片不加tag",@"不分组有图片加tag",@"正常显示效果",@"分组",@"分组有尾试图",@"可输入",@"限制输入字数",@"有开关",@"获取输入的内容",@"多行输入",@"总结显示试图",@"数据获取",];
}
-(NSArray *)plistArr{
    return @[@"demo1.plist",@"demo2.plist",@"demo3.plist",@"demo4.plist",@"demo5.plist",@"demo6.plist",@"demo7.plist",@"demo8.plist",@"demo9.plist",@"demo10.plist",@"demo11.plist",@"demo12.plist",@"demo13.plist",];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
