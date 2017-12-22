//
//  ZFBaseTableView.m
//  ZFLayoutListView
//
//  Created by linzaifei on 2017/12/20.
//  Copyright © 2017年 linzaifei. All rights reserved.
//

#import "ZFBaseTableView.h"
#import "ZFCustomCell.h"
#import "ZFCustomModel.h"
#import "ZFConfig.h"
#import "ZFSwithTableViewCell.h"
#import "ZFTextViewCell.h"
@interface ZFBaseTableView()<UITableViewDelegate,UITableViewDataSource>

@end
@implementation ZFBaseTableView
-(instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    if (self = [super initWithFrame:frame style:style]) {
        [self setUI];
    }
    return self;
}
-(void)setUI{
    self.delegate = self;
    self.dataSource = self;
    self.estimatedRowHeight = 49;
    self.sectionFooterHeight = 0;
    self.sectionHeaderHeight = 0;
    self.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
    [self registerClass:[ZFCustomCell class] forCellReuseIdentifier:NSStringFromClass([ZFCustomCell class])];
    [self registerClass:[ZFSwithTableViewCell class] forCellReuseIdentifier:NSStringFromClass([ZFSwithTableViewCell class])];
    [self registerClass:[ZFTextViewCell class] forCellReuseIdentifier:NSStringFromClass([ZFTextViewCell class])];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    ZFCustomModel *model = self.dataArr[section];
    return model.itemsArr.count;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ZFCustomModel *model = self.dataArr[indexPath.section];
    ZFDetailCustomModel *cellModel = model.itemsArr[indexPath.row];
    
    if (cellModel.type == ZFShowTypeInput) {
        ZFCustomCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([ZFCustomCell class])];
        cell.accessoryType = UITableViewCellAccessoryNone;
        cell.model =cellModel;
        return cell;
    }else if (cellModel.type == ZFShowTypeSwitch){
        ZFSwithTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([ZFSwithTableViewCell class])];
        cell.accessoryType = UITableViewCellAccessoryNone;
        cell.model =cellModel;
        return cell;
    }else if (cellModel.type == ZFShowTypeInputMore){
        ZFTextViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([ZFTextViewCell class])];
        cell.accessoryType = UITableViewCellAccessoryNone;
        cell.model =cellModel;
        return cell;
    }
    return nil;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}
-(NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath{
    return NSLocalizedString(@"删除", nil);
}
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    ZFCustomModel *model = self.dataArr[section];
    if(model.canHaveFooter){
        return 40;
    }
    return 0.001;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 35;
}


@end
