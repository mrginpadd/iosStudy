//
//  TipUtil.h
//  ios_study_bool
//
//  Created by xushihao on 2024/2/13.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface TipUtil : NSObject
+ (void)showTip:(NSString *)tip title:(NSString *)title inController:(UIViewController *)viewController;
@end

NS_ASSUME_NONNULL_END
