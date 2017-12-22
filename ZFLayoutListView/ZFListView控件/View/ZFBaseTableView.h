//
//  ZFBaseTableView.h
//  ZFLayoutListView
//
//  Created by linzaifei on 2017/12/20.
//  Copyright © 2017年 linzaifei. All rights reserved.
// 一个基类可以继承于它用来添加修改组试图或是尾试图等

#import <UIKit/UIKit.h>

@interface ZFBaseTableView : UITableView
/** 数据 */
@property (strong, nonatomic) NSMutableArray *dataArr;
@end
