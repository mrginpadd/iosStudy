//
//  ScreenUtil.h
//  ios_study_bool
//
//  Created by xushihao on 2024/1/20.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define IS_LANDSCAPE isLandScape()

#define SCREEN_WIDTH IS_LANDSCAPE ? [[UIScreen mainScreen] bounds].size.width : [[UIScreen mainScreen] bounds].size.height;

#define SCREEN_HEIGHT IS_LANDSCAPE ? [[UIScreen mainScreen] bounds].size.height : [[UIScreen mainScreen] bounds].size.width;

@interface ScreenUtil : NSObject
+ (BOOL)isLandScape;

@end


