//
//  NSObject+model.m
//  ZFRunTime
//
//  Created by linzaifei on 2018/1/24.
//  Copyright © 2018年 linzaifei. All rights reserved.
//

#import "NSObject+model.h"
#import <objc/message.h>

@implementation NSObject (model)
+(instancetype)zf_objectWithKeyValue:(id)keyValue{

    id objc = [[self alloc] init];    
    unsigned int count =0;
    objc_property_t *propertyList = class_copyPropertyList(self, &count);

    for (int i = 0; i < count; i++) {
        objc_property_t property = propertyList[i];
        NSString *key = [NSString stringWithUTF8String:property_getName(property)];
        
        id value = keyValue[key];
        if ([self respondsToSelector:@selector(zf_replacedKeyFromPropertyName)]) {
            id idSelf = self;
            if ([idSelf zf_replacedKeyFromPropertyName][key]) {
                value = keyValue[[idSelf zf_replacedKeyFromPropertyName][key]];
            }
        }
        
         /** 字典中包含字典 */
        if([value isKindOfClass:[NSDictionary class]]){
            NSString *type = [NSString stringWithUTF8String:property_getName(property)];
            type = [type capitalizedString];
            Class cls = NSClassFromString(type);
            if (cls) {
                value = [cls zf_objectWithKeyValue:value];
            }
            NSLog(@"%@",type);
        }
        
        /** 字典中包含数组 */
        if ([value isKindOfClass:[NSArray class]]) {
            /** 字典中包含数组 替换数组名用或获取对象 否则直接使用数组来创建 */
            if ([self respondsToSelector:@selector(zf_arrayContainModelClass)]) {
                id idSelf = self;
                NSString *type =  [idSelf zf_arrayContainModelClass][key];
                Class classModel = NSClassFromString(type);
                NSMutableArray *arrM = [NSMutableArray array];
                for (NSDictionary *dict in value) {
                    id model =  [classModel zf_objectWithKeyValue:dict];
                    [arrM addObject:model];
                }
                value = arrM;
            }
        }
        
        if (value) {
            [objc setValue:value forKey:key];
        }
    }
    free(propertyList);
    return objc;
}
+(NSMutableArray *)zf_objectArrayWithKeyValuesArrary:(id)keyValuesArray{
    NSMutableArray *datas = [NSMutableArray array];
    if ([keyValuesArray isKindOfClass:[NSArray class]]) {
        NSArray *arr = keyValuesArray;
        for (id data in arr) {
           Class cls = [self zf_objectWithKeyValue:data];
            [datas addObject:cls];
        }
    }
    return datas;
}
@end
