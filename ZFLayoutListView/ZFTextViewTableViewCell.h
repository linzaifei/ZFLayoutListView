//
//  ZFTextViewCell.h
//  ZFLayoutListView
//
//  Created by linzaifei on 2017/12/12.
//  Copyright © 2017年 linzaifei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZFCustomModel.h"
@interface ZFTextViewTableCell : UITableViewCell
@property(strong,nonatomic)UITextView *textView;
@property(strong,nonatomic)ZFDetailCustomModel *model;

@end
