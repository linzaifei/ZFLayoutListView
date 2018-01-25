//
//  ZFItem.m
//  ZFLayoutListView
//
//  Created by linzaifei on 2017/12/6.
//  Copyright © 2017年 linzaifei. All rights reserved.
//

#import "ZFItem.h"
@interface ZFItem()

@property(strong,nonatomic)UIImageView *imageView;
@property(strong,nonatomic)UILabel *lable;
@property(strong,nonatomic)MASConstraint *constraint;
@end

@implementation ZFItem
-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
        [self setUI];
        [self setRAC];
    }
    return self;
}
-(instancetype)init{
    if (self = [super init]) {
        [self setUI];
        [self setRAC];
    }
    return self;
}
-(void)setRAC{
    RAC(self.imageView,image) = RACObserve(self, image);
    RAC(self.lable,text) = RACObserve(self, title);
    RAC(self.lable,textColor) = RACObserve(self, titleColor);
    RAC(self.lable,font) = RACObserve(self, font);
    @weakify(self);
    [[RACSignal combineLatest:@[RACObserve(self,title),RACObserve(self, canTag)] reduce:^id(NSString *title,NSNumber *canTag){
        return @(title.length && [canTag boolValue]);
    }]subscribeNext:^(id  _Nullable x) {
        @strongify(self);
        if ([x boolValue]) {
            self.lable.attributedText = [self setAttributedString:self.title];
        }else{
            self.lable.text = self.title;
        }
    }];

    [[RACSignal combineLatest:@[RACObserve(self, image),RACObserve(self, title)] reduce:^id(UIImage *img,NSString *title){
        return @(!img && title.length >0);
    }]subscribeNext:^(id  _Nullable x) {
        @strongify(self);
        self.imageView.hidden = [x boolValue];
        if ([x boolValue]) {
            [self.constraint uninstall];
            [self.lable mas_updateConstraints:^(MASConstraintMaker *make) {
               self.constraint = make.left.equalTo(self).offset(10);
            }];
        }else{
            [self.constraint uninstall];
            [self.lable mas_updateConstraints:^(MASConstraintMaker *make) {
              self.constraint =  make.left.equalTo(self.imageView.mas_right).offset(5);
            }];

        }
    }];
    
}
-(void)setUI{
    self.imageView = [UIImageView new];
//    self.imageView.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:self.imageView];
    
    self.lable = [UILabel new];
//    self.lable.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:self.lable];

    [self.imageView setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@10);
        make.width.height.equalTo(@18);
        make.centerY.equalTo(self.mas_centerY);
    }];
    [self.lable mas_makeConstraints:^(MASConstraintMaker *make) {
      self.constraint =  make.left.equalTo(self.imageView.mas_right).offset(5);
        make.centerY.equalTo(self.mas_centerY);
        make.right.equalTo(self.mas_right);
        make.top.bottom.equalTo(self);
    }];
//    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[_imageView]-5-[_lable]-0-|" options:NSLayoutFormatAlignAllCenterY metrics:nil views:@{@"_imageView":_imageView,@"_lable":_lable}]];
//    [self addConstraint:[NSLayoutConstraint constraintWithItem:_lable attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0]];
}
//这是文本后面添加*
-(NSMutableAttributedString *)setAttributedString:(NSString *)str {
    NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc] initWithString:str];
    NSMutableAttributedString *attStr = [[NSMutableAttributedString alloc] initWithString:@"*"];
    [attStr addAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:18],
                            NSForegroundColorAttributeName : [UIColor redColor],
                            NSBaselineOffsetAttributeName : @(-4)
                            } range:NSMakeRange(0, attStr.length)];
    [attributedStr appendAttributedString:attStr];
    return attributedStr;
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
