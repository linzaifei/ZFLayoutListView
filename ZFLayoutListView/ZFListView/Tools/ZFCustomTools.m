//
//  ZFCustomManager.m
//  xihuacourt
//
//  Created by linzaifei on 2017/10/16.
//  Copyright © 2017年 林再飞. All rights reserved.
//

#import "ZFCustomTools.h"

const NSString *zf_key = @"key";
const NSString *zf_placeholder = @"placeholder";

@implementation ZFCustomTools
//* plist转模型
+(NSMutableArray <ZFCustomModel *>*)zf_getDataWithPlist:(NSString *)plist{
    NSString *path = [[NSBundle mainBundle] pathForResource:plist ofType:nil];
    NSArray *arr = [NSArray arrayWithContentsOfFile:path];
    return [ZFCustomModel zf_objectArrayWithKeyValuesArrary:arr];
}

/** 获取底层模型 */
+(ZFDetailCustomModel *)zf_getModelWithArr:(NSArray <ZFCustomModel *>*)dataArr fromIndexPath:(NSIndexPath *)path{
    ZFCustomModel *model = dataArr[path.section];
    return model.itemsArr[path.row];
}
/** 根据模型获取转换数据 */
+(id)zf_getObjctWithModelArr:(NSArray *)dataArr{
    return [ZFCustomModel zf_objectArrayWithKeyValuesArrary:dataArr];
}
/**
 根据输入的数据获取输入数据 并且转成对于需要的数据 key-value
 originalArr 存储是key
 一组或多组使用
 @[@[string,string,string,string,],@[string,string,string,string,]];
 */
+(NSMutableDictionary *)zf_getObjectWithModelArr:(NSMutableArray *)dataArr WithOriginal:(NSArray *)originalKeys{
   __block NSMutableDictionary *parmas = [NSMutableDictionary dictionary];
    [dataArr enumerateObjectsUsingBlock:^(ZFCustomModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSArray *itemArr = originalKeys[idx];
        [obj.itemsArr enumerateObjectsUsingBlock:^(ZFDetailCustomModel * _Nonnull item, NSUInteger idx1, BOOL * _Nonnull stop1) {
            if(item.canEdit || item.type == ZFShowTypeSwitch){
                [parmas setValue:((item.type == ZFShowTypeSwitch)?@(item.on):item.text) forKey:itemArr[idx1]];
            }
        }];
    }];
    return parmas;
}
/** 根据输入数据 判断数据能不能为空 */
+(NSDictionary *(^)(NSArray *dataArr))zf_changeInputData{
    return ^(NSArray *dataArr){
        __block NSMutableDictionary *parmas = [NSMutableDictionary dictionary];
         [parmas setObject:@(NO) forKey:zf_key];
        [dataArr enumerateObjectsUsingBlock:^(ZFCustomModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [obj.itemsArr enumerateObjectsUsingBlock:^(ZFDetailCustomModel * _Nonnull item, NSUInteger idx1, BOOL * _Nonnull stop1) {
                if (!item.canEmpty && item.type != ZFShowTypeSwitch && item.canEdit && item.text.length ==0) {
                    *stop = YES;
                    *stop1 = YES;
                    [parmas setObject:@(YES) forKey:zf_key];
                    [parmas setObject:item.placeholder forKey:zf_placeholder];
                }
            }];
        }];
       
        return parmas;
    };
}

@end
