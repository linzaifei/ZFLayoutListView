//
//  ZFCustomManager.h
//  xihuacourt
//
//  Created by linzaifei on 2017/10/16.
//  Copyright © 2017年 林再飞. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZFCustomModel.h"
#import "ZFCustomHeader.h"

@interface ZFCustomTools : NSObject

/** plist转模型 */
+(NSMutableArray <ZFCustomModel *>*)zf_getDataWithPlist:(NSString *)plist;
/** 根据indexPath获取对应模型 */
+(ZFDetailCustomModel *)zf_getModelWithArr:(NSArray *)dataArr fromIndexPath:(NSIndexPath *)path;
/** 根据模型获取转换数据 */
+(id)zf_getObjctWithModelArr:(NSArray *)dataArr;
/**
 根据输入的数据获取输入数据 并且转成对于需要的数据 key-value
 originalArr 存储是key
 一组或多组使用
 @[@[string,string,string,string,],@[string,string,string,string,]];
 必须一一对应才可以 
 */
+(NSMutableDictionary *)zf_getObjectWithModelArr:(NSMutableArray *)dataArr WithOriginal:(NSArray *)originalKeys;

/** 根据输入数据 判断数据能不能为空
 调用方法 [ZFCustomTools zf_changeInputData](NSarray) 返回字典
 */
+(NSDictionary *(^)(NSArray *dataArr))zf_changeInputData;
@end
