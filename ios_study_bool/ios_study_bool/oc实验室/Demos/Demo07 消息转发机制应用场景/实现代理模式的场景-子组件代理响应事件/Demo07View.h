//
//  Demo07View.h
//  ios_study_bool
//
//  Created by xushihao on 2025/5/25.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface Demo07View : UIView
@property(copy, nonatomic) NSString *title;
@property(assign, nonatomic) BOOL multipleChoice;
@property(assign, nonatomic) NSInteger maxChoiceNumber;
@property(strong, nonatomic) void(^didCommitBlock)(NSArray<NSString*>* selectedData);
@end

NS_ASSUME_NONNULL_END
