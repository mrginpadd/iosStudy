//
//  CTMediator.m
//  ios_study_bool
//
//  Created by xushihao on 2024/2/16.
//

#import "CTMediator.h"

@implementation CTMediator

//target-action解耦方案
+ (__kindof UIViewController *)getViewControllerWithVCName:(NSString *)vcName {
    Class detailCls = NSClassFromString(vcName);
    UIViewController *vc = [[detailCls alloc] performSelector:NSSelectorFromString(@"init")];
    
    return vc;
}

//urlscheme 解耦
+ (NSMutableDictionary *)mediatorCache {
    static NSMutableDictionary *cache;
    static dispatch_once_t *onceToken;
    dispatch_once(&onceToken, ^{
        cache = @{}.mutableCopy;
    });
    return cache;
}
//将特定的 URL Scheme（协议）与处理逻辑（处理程序块）进行关联，以便在后续需要时能够根据该 Scheme 找到对应的处理程序并执行相应操作。
+ (void)registerScheme:(NSString *)schema processBlock:(CTMediatorProcessBlock)processBlock {
    if (schema && processBlock) {
        [[[self class] mediatorCache] setObject:processBlock forKey:schema];
    }
}

+ (void)openUrl:(NSString *)url params:(NSDictionary *)params {
    CTMediatorProcessBlock block = [[[self class] mediatorCache] objectForKey:url];
    if (block) {
        block(params);
    }
}

//protocol class解耦方案
+ (void)registerProtocol:(Protocol *)protocol class:(Class)clas {
    if (protocol && clas) {
        [[[self class] mediatorCache] setObject:clas forKey:NSStringFromProtocol(protocol)];
    }
}

+ (Class)classForProtocol:(Protocol *)protocol {
    return [[[self class] mediatorCache]  objectForKey:NSStringFromProtocol(protocol)];
}
@end
