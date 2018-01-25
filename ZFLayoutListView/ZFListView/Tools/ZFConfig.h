//
//  ZFConfig.h
//  ZFLayoutListView
//
//  Created by linzaifei on 2017/12/6.
//  Copyright © 2017年 linzaifei. All rights reserved.
//

#ifndef ZFConfig_h
#define ZFConfig_h
#define HexRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]//十六进制转换

//设备屏幕尺寸
#define kScreenHeight   [UIScreen mainScreen].bounds.size.height
#define kScreenWidth    [UIScreen mainScreen].bounds.size.width

#endif /* ZFConfig_h */
