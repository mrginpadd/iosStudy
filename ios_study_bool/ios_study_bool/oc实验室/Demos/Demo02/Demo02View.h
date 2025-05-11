//
//  Demo02View.h
//  ios_study_bool
//
//  Created by xushihao on 2025/5/11.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

//定义 block 类型
//typedef 返回值(^闭包名称)(闭包入参)
typedef void (^Demo02ViewClickBlock)(void);

@interface Demo02View : UIView
@property(nonatomic, strong) NSString* title;
@property(nonatomic, copy) Demo02ViewClickBlock onTap; //点击回调

-(instancetype)initWithTitle:(NSString*)title;
@end

NS_ASSUME_NONNULL_END
