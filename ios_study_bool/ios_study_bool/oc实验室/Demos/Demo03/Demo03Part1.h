//
//  Demo03Part1.h
//  ios_study_bool
//
//  Created by xushihao on 2025/5/11.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

// 定义 block 类型
typedef void (^Demo02ViewOnTap)(void);
@interface Demo03Part1 : UIView
//block模式点击回调
@property(nonatomic, copy) Demo02ViewOnTap onTap;
@end

NS_ASSUME_NONNULL_END
