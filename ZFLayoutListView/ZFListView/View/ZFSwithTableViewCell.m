//
//  ZFSwithTableViewCell.m
//  ZFLayoutListView
//
//  Created by linzaifei on 2017/12/20.
//  Copyright © 2017年 linzaifei. All rights reserved.
//

#import "ZFSwithTableViewCell.h"
#import "ZFCustomModel.h"
#import "ZFConfig.h"
#import "ZFItem.h"
@interface ZFSwithTableViewCell()
@property(strong,nonatomic)ZFItem *item;
@property(strong,nonatomic)UISwitch *swith;
@end
@implementation ZFSwithTableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setUI];
        [self setRAC];
        @weakify(self);
        [RACObserve(self, model) subscribeNext:^(ZFDetailCustomModel*  _Nullable model) {
            @strongify(self);
            self.item.image = model.titleImg?[UIImage imageNamed:model.titleImg] :nil;
            self.item.title = model.title;
            self.item.canTag = model.canTag;
            self.swith.on = model.on;
        }];
    }
    return self;
}
-(void)setRAC{
    @weakify(self);
    [self.swith.rac_newOnChannel subscribeNext:^(NSNumber * _Nullable x) {
        @strongify(self);
        self.model.on = [x boolValue];
    }];
        
}
-(void)setUI{
    
    self.item = [ZFItem new];
    self.item.font = [UIFont systemFontOfSize:15];
    self.item.titleColor = HexRGB(0x333333);
    [self addSubview:self.item];
    [self.item setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
    
    self.swith = [UISwitch new];
    [self addSubview:self.swith];
    
    [self.item mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@10);
        make.centerY.equalTo(self.mas_centerY);
    }];
    [self.swith mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.greaterThanOrEqualTo(self.item.mas_right).offset(3);
        make.centerY.equalTo(self.item.mas_centerY);
        make.right.equalTo(self.mas_right).offset(-15);
    }];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
