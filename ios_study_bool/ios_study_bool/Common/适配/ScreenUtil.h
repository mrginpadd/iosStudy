//
//  ScreenUtil.h
//  ios_study_bool
//
//  Created by xushihao on 2024/1/20.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define IS_LANDSCAPE ([ScreenUtil isLandScape])

#define SCREEN_WIDTH (IS_LANDSCAPE ? [[UIScreen mainScreen] bounds].size.width : [[UIScreen mainScreen] bounds].size.height)

#define SCREEN_HEIGHT (IS_LANDSCAPE ? [[UIScreen mainScreen] bounds].size.height : [[UIScreen mainScreen] bounds].size.width)

#define IS_IPHONE_X_XR_MAX (IS_IPHONE_X || IS_IPHONE_XR || IS_IPHONE_XMAX)

#define IS_IPHONE_X (SCREEN_WIDTH == [ScreenUtil sizeFor58Inch].width && SCREEN_HEIGHT == [ScreenUtil sizeFor58Inch].height)

#define IS_IPHONE_XR (SCREEN_WIDTH == [ScreenUtil sizeFor61Inch].width && SCREEN_HEIGHT == [ScreenUtil sizeFor61Inch].height && [UIScreen mainScreen].scale == 2)

#define IS_IPHONE_XMAX (SCREEN_WIDTH == [ScreenUtil sizeFor65Inch].width && SCREEN_HEIGHT == [ScreenUtil sizeFor65Inch].height && [UIScreen mainScreen].scale == 3)


#define STATUSBARHEIGHT (IS_IPHONE_X_XR_MAX ? 44.0 : 20.0)

#define NAVBARHEIGHT (IS_IPHONE_X_XR_MAX ? 88.0 : 64.0)

#define TOPHEIGHT (STATUSBARHEIGHT + NAVBARHEIGHT)
@interface ScreenUtil : NSObject
+ (BOOL)isLandScape;
// iphone xs max
+ (CGSize)sizeFor65Inch;

// iphone xs max
+ (CGSize)sizeFor61Inch;

// iphone xs max
+ (CGSize)sizeFor58Inch;

@end


