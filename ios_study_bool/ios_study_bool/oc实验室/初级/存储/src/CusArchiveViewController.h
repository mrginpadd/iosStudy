//
//  CusArchiveViewController.h
//  ios_study_bool
//
//  Created by xushihao on 2024/2/18.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CusArchiveViewController : UIViewController

@end



// 1.定义一个实现 NSCoding 协议的自定义类：
@interface Person : NSObject <NSCoding>
@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) NSInteger age;
@end

NS_ASSUME_NONNULL_END
