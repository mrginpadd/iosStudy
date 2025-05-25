//
//  Demo07TableViewCell.h
//  ios_study_bool
//
//  Created by xushihao on 2025/5/25.
//

#import <UIKit/UIKit.h>
#import "Demo07View.h"
NS_ASSUME_NONNULL_BEGIN

@interface Demo07TableViewCell : UITableViewCell
@property(copy, nonatomic) NSString *title;
@property(assign, nonatomic) BOOL multipleChoice;
@property(assign, nonatomic) NSInteger maxChoiceNumber;
@property(strong, nonatomic) void(^didCommitBlock)(NSArray<NSString*>* selectedData);

@property(nonatomic, strong, readwrite) Demo07View *demoView;
@end

NS_ASSUME_NONNULL_END
