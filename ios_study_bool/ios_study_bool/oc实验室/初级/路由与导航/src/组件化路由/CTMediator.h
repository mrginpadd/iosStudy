//
//  CTMediator.h
//  ios_study_bool
//
//  Created by xushihao on 2024/2/16.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@protocol BViewControllerProtocol <NSObject>

- (__kindof UIViewController *)initWithUrl:(NSString *) detailUrl;
- (__kindof UIViewController *)init;
@end


@interface CTMediator : NSObject
//target-action 解耦
+ (__kindof UIViewController *)getViewControllerWithVCName:(NSString *)vcName;

//urlscheme 解耦
typedef void(^CTMediatorProcessBlock)(NSDictionary *params);

+ (NSMutableDictionary *)mediatorCache;
+ (void)registerScheme:(NSString *)schema processBlock:(CTMediatorProcessBlock)processBlock;
+ (void)openUrl:(NSString *)url params:(NSDictionary*)params;

//protocol-class 解耦方案
+ (void)registerProtocol:(Protocol *)protocol class:(Class)clas;
+ (Class)classForProtocol:(Protocol *)protocol;

@end

NS_ASSUME_NONNULL_END
