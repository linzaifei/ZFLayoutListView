//
//  NSObject+model.h
//  ZFRunTime
//
//  Created by linzaifei on 2018/1/24.
//  Copyright © 2018年 linzaifei. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ZFModelDelegate <NSObject>

@optional
/** 将字典中的数组转模型 */
+ (NSDictionary *)zf_arrayContainModelClass;
/** 修改对应的key */
+(NSDictionary *)zf_replacedKeyFromPropertyName;
@end
@interface NSObject (model)

+(instancetype)zf_objectWithKeyValue:(id)keyValue;
+(NSMutableArray *)zf_objectArrayWithKeyValuesArrary:(id)keyValuesArray;
@end
