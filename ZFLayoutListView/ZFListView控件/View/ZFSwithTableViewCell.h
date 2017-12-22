//
//  ZFSwithTableViewCell.h
//  ZFLayoutListView
//
//  Created by linzaifei on 2017/12/20.
//  Copyright © 2017年 linzaifei. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ZFDetailCustomModel;
@interface ZFSwithTableViewCell : UITableViewCell
@property(strong,nonatomic)ZFDetailCustomModel *model;
@property(strong,nonatomic,readonly)UISwitch *swith;
@end
