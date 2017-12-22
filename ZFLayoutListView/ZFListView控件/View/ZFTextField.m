//
//  ZFTextField.m
//  xihuacourt
//
//  Created by xinshiyun on 2017/7/19.
//  Copyright © 2017年 林再飞. All rights reserved.
//

#import "ZFTextField.h"
@interface ZFTextField()

@end
@implementation ZFTextField
-(instancetype)init{
    if (self = [super init]) {
        self.leftDistence = 45;
        self.limitLength = 0;
    }
    return self;
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
        self.leftDistence = 45;
        self.limitLength = 0;
    }
    return self;
}
-(void)layoutSubviews{
    [super layoutSubviews];
    @weakify(self);
    [[[NSNotificationCenter defaultCenter] rac_addObserverForName:UITextFieldTextDidChangeNotification object:nil] subscribeNext:^(NSNotification * _Nullable x) {
        @strongify(self);
        NSNotification *not = (NSNotification *)x;
        UITextField *textField = not.object;
        if (textField == self && self.limitLength != 0) {
            if (self.text.length > self.limitLength) {
                textField.text = [textField.text substringToIndex:self.limitLength];
            }
        }
    }];
}
- (CGRect)leftViewRectForBounds:(CGRect)bounds{
    CGRect iconRect = [super leftViewRectForBounds:bounds];
    iconRect.origin.x += 15; //像右边偏15
    return iconRect;
}
//UITextField 文字与输入框的距离
- (CGRect)textRectForBounds:(CGRect)bounds{
    return CGRectInset(bounds, self.leftDistence, 0);
}
//控制文本的位置
- (CGRect)editingRectForBounds:(CGRect)bounds{
    return CGRectInset(bounds, self.leftDistence, 0);
}

-(void)setPlaceholderColor:(UIColor *)placeholderColor{
    if (_placeholderColor != placeholderColor) {
        _placeholderColor = placeholderColor;
       [self setValue:placeholderColor forKeyPath:@"_placeholderLabel.textColor"];
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
