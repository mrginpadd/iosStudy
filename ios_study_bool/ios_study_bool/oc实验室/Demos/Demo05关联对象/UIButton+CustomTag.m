//
//  UIButton+CustomTag.m
//  ios_study_bool
//
//  Created by xushihao on 2025/5/24.
//

#import "UIButton+CustomTag.h"
#import <objc/runtime.h>
static char kCustomTagKey;
@implementation UIButton(CustomTag)


- (void)setCustomTag:(id)customTagVal {
    objc_setAssociatedObject(self, &kCustomTagKey, customTagVal, OBJC_ASSOCIATION_COPY_NONATOMIC);
    
}

- (id)customTag {
    return objc_getAssociatedObject(self, &kCustomTagKey);
}

@end
