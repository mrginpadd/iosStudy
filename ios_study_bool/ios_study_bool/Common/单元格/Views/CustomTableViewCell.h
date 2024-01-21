//
//  CustomTableViewCell.h
//  ios_study_bool
//
//  Created by xushihao on 2024/1/21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CustomTableViewCell : UITableViewCell
@property(nonatomic, strong, readwrite) UILabel* titleLabel;
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;
@end

NS_ASSUME_NONNULL_END
