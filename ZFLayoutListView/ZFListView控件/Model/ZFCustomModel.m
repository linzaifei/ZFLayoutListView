//
//  ZFListModel.m
//  xihuacourt
//
//  Created by linzaifei on 2017/10/16.
//  Copyright © 2017年 林再飞. All rights reserved.
//

#import "ZFCustomModel.h"
#import <objc/message.h>
@implementation ZFCustomModel

-(void)setItemsArr:(NSMutableArray *)itemsArr{
    _itemsArr = [ZFDetailCustomModel mj_objectArrayWithKeyValuesArray:itemsArr];
}
-(id)copyWithZone:(NSZone *)zone {
    ZFCustomModel *model = [[[self class]allocWithZone:zone]init];    
    model->_sectionHeaderTitle = [_sectionHeaderTitle copy];
    model->_section = _section;
    model->_sectionFooterTitle = [_sectionFooterTitle copy];
    model->_canHaveFooter = _canHaveFooter;
    model->_canDelete = _canDelete;
    model->_itemsArr = [[NSMutableArray alloc]initWithArray:_itemsArr copyItems:YES];
    return model;
}
@end

@implementation ZFDetailCustomModel
-(id)copyWithZone:(NSZone *)zone {
    ZFDetailCustomModel *model = [[[self class]allocWithZone:zone]init];
    model->_canEdit = _canEdit;
    model->_canHiddenBack = _canHiddenBack;
    model->_canEmpty = _canEmpty;
    model->_isBord = _isBord;
    model->_limitLength = _limitLength;
    model->_keyboardType = _keyboardType;
    model->_placeholder = [_placeholder copy];
    model->_title = [_title copy];
    model->_text = [_text copy];
    model->_canTag = _canTag;
    model->_on= _on;
    model->_type = _type;
    model->_dataArr = [[NSMutableArray alloc] initWithArray:_dataArr copyItems:YES];
    model->_parmas = [_parmas copy];
    return model;
}

@end
