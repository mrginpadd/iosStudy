//
//  ScreenUtil.h
//  today_news_oc
//
//  Created by xushihao on 2023/12/17.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN



#define IS_LANDSCAPE (UIInterfaceOrientationIsLandscape([[UIApplication sharedApplication] statusBarOrientation]))
#define SCREEN_WIDTH (IS_LANDSCAPE ? [[UIScreen mainScreen] bounds].size.height : [[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT (IS_LANDSCAPE ? [[UIScreen mainScreen] bounds].size.width : [[UIScreen mainScreen] bounds].size.height)


#define UI(x) UIAdapter(x)
#define UIRect(x,y,width,height) UIRectAdapter(x,y,width,height)

#define IS_IPHONE_X_XR_MAX (IS_IPHONE_X || IS_IPHONE_XR || IS_IPHONE_XMAX)

#define IS_IPHONE_X (SCREEN_WIDTH == [ScreenUtil sizeFor58Inch].width && SCREEN_HEIGHT == [ScreenUtil sizeFor58Inch].height)

#define IS_IPHONE_XR (SCREEN_WIDTH == [ScreenUtil sizeFor61Inch].width && SCREEN_HEIGHT == [ScreenUtil sizeFor61Inch].height && [UIScreen mainScreen].scale == 2)

#define IS_IPHONE_XMAX (SCREEN_WIDTH == [ScreenUtil sizeFor65Inch].width && SCREEN_HEIGHT == [ScreenUtil sizeFor65Inch].height && [UIScreen mainScreen].scale == 3)


#define STATUSBARHEIGHT (IS_IPHONE_X_XR_MAX ? 44.0 : 20.0)

#define NAVIGATIONBARHEIGHT 44.0

static inline NSInteger UIAdapter(float x) {
    //1 - 分机型 特定比例
    //2 - 屏幕宽度按比例适配
    CGFloat scale = 414 / SCREEN_WIDTH;
    return (NSInteger)x / scale;
}

static inline CGRect UIRectAdapter(x,y,width,height) {
    return CGRectMake(UIAdapter(x), UIAdapter(y), UIAdapter(width), UIAdapter(height));
}

@interface ScreenUtil : NSObject

// iphone xs max
+ (CGSize)sizeFor65Inch;

// iphone xs max
+ (CGSize)sizeFor61Inch;

// iphone xs max
+ (CGSize)sizeFor58Inch;

@end

NS_ASSUME_NONNULL_END
