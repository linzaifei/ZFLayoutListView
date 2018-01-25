
//  ZFCumtomView.m
//  xihuacourt
//
//  Created by linzaifei on 2017/10/16.
//  Copyright © 2017年 林再飞. All rights reserved.
//

#import "ZFCumtomView.h"
#import "ZFConfig.h"

@interface ZFCumtomView()<UITextFieldDelegate>

@property(strong,nonatomic)ZFItem *item;
@property(strong,nonatomic,readwrite)ZFTextField *textField;
@property(strong,nonatomic)UIImageView *backImageV;
@end

@implementation ZFCumtomView
-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
        self.backgroundColor = [UIColor whiteColor];
        [self setUI];
        [self setRAC];
    }
    return self;
}
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        [self setUI];
        [self setRAC];
    }
    return self;
}

-(void)setRAC{
    RAC(self.textField,enabled) = RACObserve(self,canEdit);
    @weakify(self);
    [RACObserve(self,keyboardType) subscribeNext:^(id  _Nullable x) {
        @strongify(self);
        self.textField.keyboardType = self.keyboardType;
    }];
}


-(void)setUI{
    
    self.item = [ZFItem new];
    self.item.font = [UIFont systemFontOfSize:15];
    self.item.titleColor = HexRGB(0x333333);
    [self addSubview:self.item];
    self.item.translatesAutoresizingMaskIntoConstraints = NO;
    [self.item setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
    
    self.textField = [ZFTextField new];
    self.textField.leftDistence = 10;
    self.textField.textColor = HexRGB(0x333333);
    self.textField.font = [UIFont systemFontOfSize:14];
    self.textField.delegate = self;
    self.textField.textAlignment = NSTextAlignmentRight;
    self.textField.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:self.textField];


    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.item attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1.0 constant:10 ]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.item attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0 ]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_textField attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationGreaterThanOrEqual toItem:self.item attribute:NSLayoutAttributeLeft multiplier:1.0 constant:3 ]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_textField attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0]];
    
 [self addConstraint:[NSLayoutConstraint constraintWithItem:_textField attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeRight multiplier:1.0 constant:-10]];

}

-(void)layoutSubviews{
    [super layoutSubviews];
    self.textField.rightView = self.backImageV;
    self.textField.rightViewMode = self.canHiddenBack?UITextFieldViewModeNever :UITextFieldViewModeAlways;
}    
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    NSString *tem = [[string componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceCharacterSet]]componentsJoinedByString:@""];
    if (![string isEqualToString:tem]) {
        return NO;
    }
    return YES;
}
- (UIImageView *)backImageV{
    if (_backImageV == nil) {
        _backImageV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 7, 11)];
        _backImageV.contentMode = UIViewContentModeCenter;
        _backImageV.image = [UIImage imageNamed:[@"ZFImg.bundle" stringByAppendingPathComponent:@"zf_back"]];
    }
    return _backImageV;
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [super touchesEnded:touches withEvent:event];
}

@end

