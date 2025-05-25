//
//  Demo07Model1.m
//  ios_study_bool
//
//  Created by xushihao on 2025/5/25.
//

#import "Demo07Model1.h"
#import <objc/runtime.h>
@implementation Demo07Model1
- (void)setPrice:(NSInteger)price {
    NSLog(@"Demo07Model1  setPrice");
}
@end

@implementation Demo07Model2

//
//所以在 .m 文件中, 直接转发给 self.detail, 即转发给原来的道具对象, 仅需自己实现原来道具没有的方法即可。
- (id)forwardingTargetForSelector:(SEL)aSelector {
    return self.detail;
}

@end
