//
//  ZFCustomTableView.m
//  xihuacourt
//
//  Created by linzaifei on 2017/10/17.
//  Copyright © 2017年 林再飞. All rights reserved.
//

#import "ZFCustomTableView.h"
#import "ZFCustomCell.h"
#import "ZFCustomModel.h"
#import "ZFConfig.h"
@interface ZFCustomTableView()

@end
@implementation ZFCustomTableView

-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    ZFCustomModel *model = self.dataArr[indexPath.section];
    if (model.canDelete) {
        return YES;
    }
    return NO;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 0, 30)];
    label.backgroundColor = HexRGB(0xf2f2f2);
    label.textColor = HexRGB(0x999999);
    label.font = [UIFont systemFontOfSize:14];
    ZFCustomModel *model = self.dataArr[section];
    label.text = [NSString stringWithFormat:@"  %@",model.sectionHeaderTitle];
    return label;
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    ZFCustomModel *model = self.dataArr[section];
    if(model.canHaveFooter){
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.backgroundColor = HexRGB(0xffffff);
        btn.frame = CGRectMake(0, 0, kScreenWidth, 40);
        [btn setTitle:model.sectionFooterTitle forState:UIControlStateNormal];
        [btn setTitleColor:HexRGB(0x333333) forState:UIControlStateNormal];
//        [btn setImage:[UIImage imageNamed:@"ico_add"] forState:UIControlStateNormal];
//        [btn layoutButtonWithButtonEdgeInsetsStyle:ButtonEdgeInsetsStyleLeft WithImageAndTitleSpace:5];
        btn.titleLabel.font = [UIFont systemFontOfSize:15];
////        @weakify(self);
//        btn.rac_command = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
//            @strongify(self);
//            if (self.clickFooterBlock) {
//                self.clickFooterBlock(model);
//            }
//            return [RACSignal empty];
//        }];
        return btn;
    }
    return nil;
}

@end
