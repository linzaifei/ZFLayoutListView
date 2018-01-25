//
//  ZFListModel.m
//  xihuacourt
//
//  Created by linzaifei on 2017/10/16.
//  Copyright © 2017年 林再飞. All rights reserved.
//

#import "ZFCustomModel.h"
#import <objc/message.h>
#import "ZFCustomHeader.h"
@implementation ZFCustomModel

-(void)setItemsArr:(NSMutableArray *)itemsArr{
    _itemsArr = [ZFDetailCustomModel zf_objectArrayWithKeyValuesArrary:itemsArr];
}
-(id)copyWithZone:(NSZone *)zone {
    id objc = [[[self class] allocWithZone:zone] init];
    Class clazz = [self class];
    unsigned int count;
    objc_property_t* properties = class_copyPropertyList(clazz, &count);
    for (int i = 0; i < count ; i++){
        NSString *key = [NSString stringWithUTF8String:property_getName(properties[i])];
        id value=[self valueForKey:key];
        if([value respondsToSelector:@selector(copyWithZone:)]){
            [objc setValue:[value copy] forKey:key];
        }else{
            [objc setValue:value forKey:key];
        }
    }
    free(properties);
    return objc;
}



@end

@implementation ZFDetailCustomModel
-(id)copyWithZone:(NSZone *)zone {
    id objc = [[[self class] allocWithZone:zone] init];
    Class clazz = [self class];
    unsigned int count;
    objc_property_t* properties = class_copyPropertyList(clazz, &count);
    for (int i = 0; i < count ; i++){
        NSString *key = [NSString stringWithUTF8String:property_getName(properties[i])];
        id value=[self valueForKey:key];
        if([value respondsToSelector:@selector(copyWithZone:)]){
            [objc setValue:[value copy] forKey:key];
        }else{
            [objc setValue:value forKey:key];
        }
    }
    free(properties);
    return objc;
}


@end
