//
//  CusUIWKWebViewController.m
//  ios_study_bool
//
//  Created by xushihao on 2024/2/14.
//

#import "CusUIWKWebViewController.h"
#import "IntroductionViewController.h"
@interface CusUIWKWebViewController ()<IntroductionViewControllerDelegate>

@end

@implementation CusUIWKWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    IntroductionViewController *vc = [[IntroductionViewController alloc] init];

}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
