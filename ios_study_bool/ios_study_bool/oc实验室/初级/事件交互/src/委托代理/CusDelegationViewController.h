//
//  CusDelegationViewController.h
//  ios_study_bool
//
//  Created by xushihao on 2024/2/15.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CusDelegationViewController : UIViewController

@end


@protocol CusBossViewDelegate<NSObject>
-(void)doSomething;
@end

@interface CusBossViewController : UIViewController
@property(nonatomic, weak, readwrite) id<CusBossViewDelegate> delegate;
@end

@interface CusAssistViewController : UIViewController

@end

NS_ASSUME_NONNULL_END
