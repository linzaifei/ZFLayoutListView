//
//  ZFTextViewCell.m
//  ZFLayoutListView
//
//  Created by linzaifei on 2017/12/21.
//  Copyright © 2017年 linzaifei. All rights reserved.
//

#import "ZFTextViewCell.h"
#import "ZFCustomModel.h"
#import "ZFConfig.h"
#import "ZFItem.h"
#import "ZFTextView.h"
@interface ZFTextViewCell()<UITextViewDelegate>
@property(strong,nonatomic)ZFItem *item;
@property(strong,nonatomic)ZFTextView *textView;
@property(strong,nonatomic)UILabel *placeholderLabel;
@property(strong,nonatomic)NSLayoutConstraint *heightConstraint;
@property(strong,nonatomic)NSLayoutConstraint *widthConstraint;
@end
@implementation ZFTextViewCell

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
            self.placeholderLabel.text = model.placeholder;
            self.textView.limitLength = model.limitLength;
            self.textView.text = model.text;
            self.textView.editable = model.canEdit;
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
//    self.item.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:self.item];
    [self.item setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
    
    
    self.textView = [ZFTextView new] ;
    self.textView.scrollEnabled = NO;
    self.textView.delegate = self;
//    self.textView.translatesAutoresizingMaskIntoConstraints = NO;
    self.textView.textColor = HexRGB(0x333333);
    self.textView.textAlignment = NSTextAlignmentRight;
    self.textView.font = [UIFont systemFontOfSize:14];
    [self.contentView addSubview:self.textView];
    
    [self.textView setContentCompressionResistancePriority:UILayoutPriorityDefaultLow forAxis:UILayoutConstraintAxisHorizontal];
    
    [self.item mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@10);
        make.centerY.equalTo(self.mas_centerY);
    }];

    [self.textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@4);
        make.left.equalTo(self.item.mas_right).offset(5);
        make.right.equalTo(self.mas_right).offset(-10);
        make.bottom.equalTo(self.contentView.mas_bottom);
        make.height.greaterThanOrEqualTo(@32);
        make.width.greaterThanOrEqualTo(@180);
    }];
    
//    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.item attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1.0 constant:10 ]];
//    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.item attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0 ]];
//
//    [self addConstraint:[NSLayoutConstraint constraintWithItem:_textView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1.0 constant:4]];
//
//    [self addConstraint:[NSLayoutConstraint constraintWithItem:_textView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.item attribute:NSLayoutAttributeRight multiplier:1.0 constant:5]];
//
//    [self addConstraint:[NSLayoutConstraint constraintWithItem:_textView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeRight multiplier:1.0 constant:-10]];
//
//    [self addConstraint:[NSLayoutConstraint constraintWithItem:_textView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0]];
//
//    self.heightConstraint = [NSLayoutConstraint constraintWithItem:_textView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationGreaterThanOrEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:32];
//    self.widthConstraint = [NSLayoutConstraint constraintWithItem:_textView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationGreaterThanOrEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:180];
    
//    [self addConstraint:self.heightConstraint];
//    [self addConstraint:self.widthConstraint];
    
}

- (void)textViewDidChange:(UITextView *)textView{
    CGRect bounds = textView.bounds;
    //     计算 text view 的高度
    CGSize maxSize = CGSizeMake(bounds.size.width, CGFLOAT_MAX);
    CGSize newSize = [textView sizeThatFits:maxSize];
    bounds.size = newSize;
    
//    self.heightConstraint.constant = newSize.height;
//    [self.textView layoutIfNeeded];
    
    textView.bounds = bounds;
    self.model.text = textView.text;
    // 让 table view 重新计算高度
    UITableView *tableView = [self tableView];
    [tableView beginUpdates];
    [self.textView layoutIfNeeded];
    [tableView endUpdates];
}
- (UITableView *)tableView{
    UIView *tableView = self.superview;
    while (![tableView isKindOfClass:[UITableView class]] && tableView) {
        tableView = tableView.superview;
    }
    return (UITableView *)tableView;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
}

-(UILabel *)placeholderLabel{
    if (_placeholderLabel == nil) {
        _placeholderLabel = [[UILabel alloc] init];
        _placeholderLabel.numberOfLines = 0;
        _placeholderLabel.textColor = [UIColor lightGrayColor];
        [_placeholderLabel sizeToFit];
        _placeholderLabel.textAlignment = self.textView.textAlignment;
        _placeholderLabel.font = self.textView.font;
        [self.textView addSubview:self.placeholderLabel];
        [self.textView setValue:_placeholderLabel forKey:@"_placeholderLabel"];
    }
    return _placeholderLabel;
}

@end
