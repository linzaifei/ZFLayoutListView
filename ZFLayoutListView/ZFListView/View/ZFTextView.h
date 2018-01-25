//
//  ZFTextView.h
//  ZFLayoutListView
//
//  Created by linzaifei on 2017/12/21.
//  Copyright © 2017年 linzaifei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZFTextView : UITextView
@property (nonatomic, strong) NSString *placeholder;
/** 设置placeholder颜色 */
@property(strong,nonatomic)UIColor *placeholderColor;
/** 限制输入字符长度 默认为0 不限制 (如果需要可以自己修改)*/
@property(assign,nonatomic)NSInteger limitLength;
@end
