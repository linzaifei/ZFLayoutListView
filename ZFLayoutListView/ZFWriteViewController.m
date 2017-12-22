//
//  ZFWriteViewController.m
//  ZFLayoutListView
//
//  Created by linzaifei on 2017/12/21.
//  Copyright © 2017年 linzaifei. All rights reserved.
//

#import "ZFWriteViewController.h"
#import "ZFCustomTools.h"
extern NSString *zf_key;
extern NSString *zf_placeholder;
@interface ZFWriteViewController ()

@end

@implementation ZFWriteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"点击" style:UIBarButtonItemStylePlain target:self action:@selector(action)];
    
}

-(void)action{
    
    /** 判断数据是不是为空 和返回需要填写的数据placeholder */
    NSDictionary *dic = [ZFCustomTools zf_changeInputData](self.dataArr);
    
    
    if (![dic[zf_key] boolValue]) {
    NSArray *original = @[@[@"1",@"2",@"3",@"4",@"",@"",@"7",]];
     NSDictionary *d = [ZFCustomTools zf_getObjectWithModelArr:self.dataArr WithOriginal:original];
        NSLog(@"%@",d);
    }else{
        NSLog(@"%@",dic[zf_placeholder]);
        return;
    }
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
