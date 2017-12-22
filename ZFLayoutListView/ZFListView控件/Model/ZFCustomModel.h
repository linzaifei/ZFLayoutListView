//
//  ZFListModel.h
//  xihuacourt
//
//  Created by linzaifei on 2017/10/16.
//  Copyright © 2017年 林再飞. All rights reserved.
// 用来编写List输入控件

#import <UIKit/UIKit.h>
@class ZFDetailCustomModel;
typedef NS_ENUM(NSInteger,ZFShowType){
    ZFShowTypeInput = 0,//可以输入一行
    ZFShowTypeSwitch,//按钮
    ZFShowTypeInputMore,//输入多行
};

@interface ZFCustomModel : NSObject<NSCopying>
/** 组序号 */
@property(strong,nonatomic)NSNumber *section;
/** 头试图标题 */
@property(copy,nonatomic)NSString *sectionHeaderTitle;
/** 尾视图标题 */
@property(copy,nonatomic)NSString *sectionFooterTitle;
/** 是否有尾视图  默认NO 没有尾试图 */
@property(assign,nonatomic)BOOL canHaveFooter;
/** 是否可以删除 默认 NO 不能删除*/
@property(assign,nonatomic)BOOL canDelete;
/** 组的子元素 */
@property(strong,nonatomic)NSMutableArray *itemsArr;

@end

@interface ZFDetailCustomModel:NSObject<NSCopying>
/** 判断cell 后面显示内容 输入框 按钮 等*/
@property(assign,nonatomic)ZFShowType type;

/**------- 下面是属性是对于标题的 ------------ */
/** 图片+标题 */
@property(copy,nonatomic)NSString *titleImg;
/** 标题 */
@property(copy,nonatomic)NSString *title;
/** 是否需要标记 * 默认NO */
@property(assign,nonatomic)BOOL canTag;

/**------- 下面是属性是对于单输入框的 ------------ */
/** textfield placeholder */
@property(copy,nonatomic)NSString *placeholder;
/** textfield 限制输入多少字数 默认不限制输入*/
@property(assign,nonatomic)NSInteger limitLength;
/** textfield 内容 */
@property(copy,nonatomic)NSString *text;
/** 可不可以编辑 默认 NO  */
@property(assign,nonatomic)BOOL canEdit;
/** 是否隐藏箭头 默认 NO*/
@property(assign,nonatomic)BOOL canHiddenBack;
/** 键盘类型 1 数字键盘 2 身份证 3 */
@property(strong,nonatomic)NSNumber *isBord;
/** 键盘类型 */
@property(nonatomic) UIKeyboardType keyboardType;
/** 判断输入的提交时候可不可以为空 */
@property(assign,nonatomic)BOOL canEmpty;




/**------- 下面是属性是对于开关的 ------------ */
/** 进入默认开启还是关闭 */
@property(assign,nonatomic)BOOL on;

/**------- 用于多层次列表数据传输 ------------ */

/** dataArr 用来存储model 数据类型 */
@property(strong,nonatomic)NSArray *dataArr;
/** parmas 用来存储对应数据的键值对 */
@property(strong,nonatomic)NSDictionary *parmas;

@end
