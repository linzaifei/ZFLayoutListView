//
//  ZFCumtomView.h
//  xihuacourt
//
//  Created by linzaifei on 2017/10/16.
//  Copyright © 2017年 林再飞. All rights reserved.
//
/**
 [title] [UITextField] [返回图片]
 */


#import <UIKit/UIKit.h>
#import "ZFTextField.h"
#import "ZFItem.h"

@interface ZFCumtomView : UIView
@property(strong,nonatomic,readonly)ZFItem *item;
@property(strong,nonatomic,readonly)ZFTextField *textField;
/** 键盘类型 */
@property(nonatomic) UIKeyboardType keyboardType;
/** 是否可以编辑 默认 NO 不可以编辑 */
@property(assign,nonatomic)BOOL canEdit;
/** 是否隐藏右边图片 默认NO 不隐藏 */
@property(assign,nonatomic)BOOL canHiddenBack;


@end

