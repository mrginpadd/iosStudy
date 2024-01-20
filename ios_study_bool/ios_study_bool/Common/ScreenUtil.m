//
//  ScreenUtil.m
//  ios_study_bool
//
//  Created by xushihao on 2024/1/20.
//

#import "ScreenUtil.h"

@implementation ScreenUtil
+ (BOOL)isLandScape {
    return UIInterfaceOrientationIsLandscape([[UIApplication sharedApplication] statusBarOrientation]);
}


@end
