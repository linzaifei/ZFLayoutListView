//
//  ZFTextView.m
//  ZFLayoutListView
//
//  Created by linzaifei on 2017/12/21.
//  Copyright © 2017年 linzaifei. All rights reserved.
//

#import "ZFTextView.h"
#import "ZFConfig.h"
@interface ZFTextView()

@end
@implementation ZFTextView
-(instancetype)init{
    if (self = [super init]) {
        self.limitLength = 0;
        self.placeholderColor = HexRGB(0x999999);
    }
    return self;
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
        self.limitLength = 0;
        self.placeholderColor = HexRGB(0x999999);
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    @weakify(self);
    [[[NSNotificationCenter defaultCenter] rac_addObserverForName:UITextViewTextDidChangeNotification object:nil] subscribeNext:^(NSNotification * _Nullable x) {
        @strongify(self);
        NSNotification *not = (NSNotification *)x;
        UITextView *textView = not.object;
        if (textView == self && self.limitLength != 0) {
            if (self.text.length > self.limitLength) {
                textView.text = [textView.text substringToIndex:self.limitLength];
            }
        }
    }];
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
