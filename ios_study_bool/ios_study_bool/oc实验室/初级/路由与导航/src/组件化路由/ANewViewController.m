//
//  ANewViewController.m
//  ios_study_bool
//
//  Created by xushihao on 2024/2/16.
//

#import "ANewViewController.h"
#import "CTMediator.h"
@interface ANewViewController ()

@end

@implementation ANewViewController

+ (void)load {
    [CTMediator registerScheme:@"anew://" processBlock:^(NSDictionary * _Nonnull params) {
        NSString *url = (NSString  *)[params objectForKey:@"url"];
        UINavigationController *navigationController = (UIViewController *)[params objectForKey:@"controller"];
        
        ANewViewController *targetVC = [[ANewViewController alloc] init];
        [navigationController pushViewController:targetVC animated:YES];
    }];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    self.title = @"这是A页面";
    // Do any additional setup after loading the view.
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
