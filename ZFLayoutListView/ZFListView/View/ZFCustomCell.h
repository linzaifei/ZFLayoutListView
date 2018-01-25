//
//  ZFCustomCell.h
//  xihuacourt
//
//  Created by linzaifei on 2017/10/17.
//  Copyright © 2017年 林再飞. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ZFDetailCustomModel;
@class ZFCumtomView;
@interface ZFCustomCell : UITableViewCell
@property(strong,nonatomic)ZFDetailCustomModel *model;
@property(strong,nonatomic,readonly)ZFCumtomView *customView;

@end
