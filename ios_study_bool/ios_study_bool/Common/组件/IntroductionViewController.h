//
//  IntroductionViewController.h
//  ios_study_bool
//
//  Created by xushihao on 2024/2/13.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface IntroductionViewController : UIViewController
@property(nonatomic, strong, readwrite) UIScrollView *scrollView;


@property(nonatomic, strong, readwrite) UIView *introView;
@property(nonatomic, strong, readwrite) UIView *applicationView;
@property(nonatomic, strong, readwrite) UIView *useStepView;

@property(nonatomic, strong, readwrite) UILabel *introTitleLabel;
@property(nonatomic, strong, readwrite) UILabel *introContentLabel;

@property(nonatomic, strong, readwrite) UILabel *applicationTitleLabel;
@property(nonatomic, strong, readwrite) UILabel *applicationContentLabel;

@property(nonatomic, strong, readwrite) UILabel *userStepTitleLabel;
@property(nonatomic, strong, readwrite) UILabel *useStepContentLabel;

@property(nonatomic, strong, readwrite) NSMutableArray<UIButton*>* introBtns;
@property(nonatomic, strong, readwrite) NSMutableArray<UIButton*>* applicationBtns;
@property(nonatomic, strong, readwrite) NSMutableArray<UIButton*>* useStepBtns;
- (instancetype)init;

- (void)setIntroTipBtns:(NSArray<NSString *> *)tipBtns titles: (NSArray<NSString *> *)tipTitles contents:(NSArray<NSString *> *)tipContents;

- (void)setApplicationTipBtns:(NSArray<NSString *> *)tipBtns titles: (NSArray<NSString *> *)tipTitles contents:(NSArray<NSString *> *)tipContents;

- (void)setUseStepTipBtns:(NSArray<NSString *> *)tipBtns titles: (NSArray<NSString *> *)tipTitles contents:(NSArray<NSString *> *)tipContents;

@end

NS_ASSUME_NONNULL_END
