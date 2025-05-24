//
//  UIButton+CustomTag.h
//  ios_study_bool
//
//  Created by xushihao on 2025/5/24.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIButton(CustomTag)
//分类只能实现方法，不能实现属性，如果需要实现属性，需要用关联对象的方式。
@property (nonatomic, strong) id customTag;
@end

NS_ASSUME_NONNULL_END
