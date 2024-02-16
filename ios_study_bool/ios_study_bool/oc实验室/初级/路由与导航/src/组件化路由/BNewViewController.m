//
//  BNewViewController.m
//  ios_study_bool
//
//  Created by xushihao on 2024/2/16.
//

#import "BNewViewController.h"
#import "CTMediator.h"
@interface BNewViewController ()

@end

@implementation BNewViewController

+ (void)load {
    [CTMediator registerProtocol:@protocol(BViewControllerProtocol) class:[self class]];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    self.title = @"这是B页面";
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
