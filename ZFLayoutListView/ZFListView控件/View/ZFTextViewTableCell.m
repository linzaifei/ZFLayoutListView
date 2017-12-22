//
//  ZFTextViewCell.m
//  ZFLayoutListView
//
//  Created by linzaifei on 2017/12/21.
//  Copyright © 2017年 linzaifei. All rights reserved.
//

#import "ZFTextViewTableViewCell.h"
#import "ZFCustomModel.h"
#import "ZFConfig.h"
#import "ZFItem.h"
@interface ZFTextViewTableViewCell()<UITextViewDelegate>
@property(strong,nonatomic)ZFItem *item;
//@property(strong,nonatomic)UITextView *textView;
@end
@implementation ZFTextViewTableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setUI];
        [self setRAC];
        @weakify(self);
        [RACObserve(self, model) subscribeNext:^(ZFDetailCustomModel*  _Nullable model) {
            @strongify(self);
            if (model.titleImg) {
                self.item.image = [UIImage imageNamed:model.titleImg];
            }
            self.item.title = model.title;
            self.item.canTag = model.canTag;
            
        }];
    }
    return self;
}
-(void)setRAC{

    
}
-(void)setUI{
    
    self.item = [ZFItem new];
    self.item.font = [UIFont systemFontOfSize:15];
    self.item.titleColor = HexRGB(0x333333);
    [self addSubview:self.item];
    [self.item setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
    
//    self.textView = [UITextView new] ;
//    self.textView.scrollEnabled = NO;
//    self.textView.delegate = self;
//    self.textView.textAlignment = NSTextAlignmentRight;
//    self.textView.font = [UIFont systemFontOfSize:14];
//    [self.contentView addSubview:self.textView];
//
    [self.item mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@10);
        make.centerY.equalTo(self.mas_centerY);
    }];
    
//    [self.textView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(@0);
//        make.left.greaterThanOrEqualTo(self.item.mas_right).offset(3);
//        make.right.equalTo(self.mas_right).offset(-15);
//        make.bottom.equalTo(self.contentView.mas_bottom);
//    }];
}

- (void)textViewDidChange:(UITextView *)textView{
    CGRect bounds = textView.bounds;
    //     计算 text view 的高度
    CGSize maxSize = CGSizeMake(bounds.size.width, CGFLOAT_MAX);
    CGSize newSize = [textView sizeThatFits:maxSize];
    bounds.size = newSize;
    textView.bounds = bounds;
    // 让 table view 重新计算高度
    UITableView *tableView = (UITableView *)self.contentView.superview.superview;
    [tableView beginUpdates];
    [tableView endUpdates];
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
