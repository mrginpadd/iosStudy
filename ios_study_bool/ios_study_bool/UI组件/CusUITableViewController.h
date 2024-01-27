//
//  UITableViewController.h
//  ios_study_bool
//
//  Created by xushihao on 2024/1/27.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CusUITableViewController : UIViewController

@end


@class CusTableViewCell;

@protocol CusTableViewCellDelegate <NSObject>
- (void)cell:(CusTableViewCell *)cell;
@end

// 自定义的 UITableViewCell 类
@interface CusTableViewCell : UITableViewCell

@property (nonatomic, strong) UIImageView *leftImageView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIButton *rightButton;
@property (nonatomic, weak) id<CusTableViewCellDelegate> delegate;
@end



NS_ASSUME_NONNULL_END
