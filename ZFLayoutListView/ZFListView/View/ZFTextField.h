//
//  ZFTextField.h
//  xihuacourt
//
//  Created by xinshiyun on 2017/7/19.
//  Copyright © 2017年 林再飞. All rights reserved.
// 不能输入空格

#import <UIKit/UIKit.h>
@interface ZFTextField : UITextField
/** 设置placeholder颜色 */
@property(strong,nonatomic)UIColor *placeholderColor;
/** 距离左边距离默认45 */
@property(assign,nonatomic)CGFloat leftDistence;
/** 限制输入字符长度 默认为0 不限制 (如果需要可以自己修改)*/
@property(assign,nonatomic)NSInteger limitLength;

@end
