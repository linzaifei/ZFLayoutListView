//
//  ZFItem.h
//  ZFLayoutListView
//
//  Created by linzaifei on 2017/12/6.
//  Copyright © 2017年 linzaifei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZFItem : UIView

/** 图片 */
@property(strong,nonatomic)UIImage *image;
/** 标题 */
@property(copy,nonatomic)NSString *title;
/** 是否需要标记 * 默认NO*/
@property(assign,nonatomic)BOOL canTag;
/** 标题颜色 */
@property(strong,nonatomic)UIColor *titleColor;
/** 大小 */
@property(strong,nonatomic)UIFont *font;

@end
