//
//  ToastUtil.h
//  ios_study_bool
//
//  Created by xushihao on 2024/2/14.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ToastUtil : NSObject
+(void) showToastCenter:(NSString*)message;
+(void) showToastBottom:(NSString*)message;
@end

NS_ASSUME_NONNULL_END
