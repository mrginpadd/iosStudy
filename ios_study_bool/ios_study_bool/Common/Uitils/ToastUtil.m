//
//  ToastUtil.m
//  ios_study_bool
//
//  Created by xushihao on 2024/2/14.
//

#import "ToastUtil.h"
#import <UIKit/UIKit.h>
#import "Masonry.h"
@implementation ToastUtil

+(void) showToastCenter:(NSString*)message {
    
}

+(void) showToastBottom:(NSString*)message {
    dispatch_async(dispatch_get_main_queue(), ^{
        // 获取当前活动的窗口
        UIWindow *window = nil;
        if (@available(iOS 13.0, *)) {
            for (UIWindowScene *windowScene in UIApplication.sharedApplication.connectedScenes) {
                if (windowScene.activationState == UISceneActivationStateForegroundActive) {
                    for (UIWindow *windowT in windowScene.windows) {
                        if (windowT.isKeyWindow) {
                            window = windowT;
                        }
                    }
                }
            }
        } else {
            window = [UIApplication sharedApplication].keyWindow;
        }
        
        if (window == nil) {
            return;
        }
        
        //Toast背景
        UIView *toastView = [[UIView alloc] init];
        [window addSubview:toastView];
        toastView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.7];
            toastView.layer.cornerRadius = 10.0;
        [toastView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(window);
            make.width.equalTo(@200);
            make.height.equalTo(@40);
        }];
        
        // Toast提示信息
        UILabel *msgLabel = [[UILabel alloc] init];
        [toastView addSubview:msgLabel];
        msgLabel.text = message;
        msgLabel.textColor = [UIColor whiteColor];
        msgLabel.textAlignment = NSTextAlignmentCenter;
        [msgLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.center.width.height.equalTo(toastView);
        }];
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [toastView removeFromSuperview];
        });
        
    });
}
@end
