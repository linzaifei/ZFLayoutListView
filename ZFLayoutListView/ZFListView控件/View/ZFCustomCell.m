//
//  ZFCustomCell.m
//  xihuacourt
//
//  Created by linzaifei on 2017/10/17.
//  Copyright © 2017年 林再飞. All rights reserved.
//

#import "ZFCustomCell.h"
#import "ZFCumtomView.h"
#import "ZFCustomModel.h"
#import "ZFConfig.h"
@interface ZFCustomCell()
@property(strong,nonatomic)ZFCumtomView *customView;
@end
@implementation ZFCustomCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setUI];
        [self setRAC];
    }
    return self;
}

-(void)setRAC{
    @weakify(self);
    
    [RACObserve(self, model) subscribeNext:^(ZFDetailCustomModel*  _Nullable model) {
        @strongify(self);
        self.customView.item.image = model.titleImg?[UIImage imageNamed:model.titleImg] :nil;
        self.customView.item.title = model.title;
        self.customView.item.canTag = model.canTag;
        self.customView.textField.placeholder = model.placeholder;
        self.customView.textField.limitLength = model.limitLength;
        self.customView.textField.text = model.text;
        self.customView.canEdit = model.canEdit;
        self.customView.canHiddenBack = model.canHiddenBack;
        self.customView.textField.textColor = HexRGB(0x808080);
        self.customView.textField.keyboardType = model.keyboardType;
    }];
    [self.customView.textField.rac_textSignal subscribeNext:^(NSString * _Nullable x) {
        @strongify(self);
        self.model.text = x;
    }];
    
}
-(void)setUI{
    self.customView = [ZFCumtomView new];
//    self.customView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addSubview:self.customView];
    [self.customView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.contentView);
    }];

//    [self.customView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[_customView]-0-|" options:NSLayoutFormatAlignAllCenterY metrics:nil views:@{@"_customView":_customView}]];
//    [self.customView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[_customView]-0-|" options:NSLayoutFormatAlignAllCenterY metrics:nil views:@{@"_customView":_customView}]];
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
