//
//  ZFTablViewProtocol.h
//  ZFLayoutListView
//
//  Created by linzaifei on 2017/12/20.
//  Copyright © 2017年 linzaifei. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ZFTablViewProtocol <NSObject>

-(UIView *)zf_tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section;
-(UIView *)zf_tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section;
@end
