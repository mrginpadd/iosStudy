//
//  ScreenUtil.m
//  ios_study_bool
//
//  Created by xushihao on 2024/1/20.
//

#import "ScreenUtil.h"

@implementation ScreenUtil
+ (BOOL)isLandScape {
//    UIInterfaceOrientation orientation = [UIApplication sharedApplication].windows.firstObject.windowScene.interfaceOrientation;
//    
//    if (orientation == UIInterfaceOrientationUnknown) {
//        // 当前设备不支持多窗口场景，可以使用 statusBarOrientation 获取状态栏方向
        UIInterfaceOrientation statusBarOrientation = [UIApplication sharedApplication].statusBarOrientation;
        return UIInterfaceOrientationIsLandscape(statusBarOrientation);
//    } else {
//        return UIInterfaceOrientationIsLandscape(orientation);
//    }
}

// iphone xs max
+ (CGSize)sizeFor65Inch {
    return CGSizeMake(414, 896);
}

// iphone xs max
+ (CGSize)sizeFor61Inch {
    return CGSizeMake(414, 896);
}

// iphone xs max
+ (CGSize)sizeFor58Inch {
    return CGSizeMake(375, 812);
}

@end
