//
//  CusNetWorkViewController.m
//  ios_study_bool
//
//  Created by xushihao on 2024/12/8.
//

#import "CusNetWorkViewController.h"
#import "CusNetworkUserModel.h"
@interface CusNetWorkViewController ()

@end

@implementation CusNetWorkViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    IntroductionViewController *vc = [[IntroductionViewController alloc] init];
    [self addChildViewController:vc];
    [self.view addSubview:vc.view];
    [vc didMoveToParentViewController:self];
    vc.delegate = self;
    
    vc.introTitleLabel.text = @"网络与Json";
    vc.introContentLabel.text = @"网络请求回来的数据在本地一般都有个model，model要实现toJson\ toDictionary\ :(CusNetworkUserModel *)user 这三个方法，以便获取网络请求数据时方便转换格式。";
    [vc setUseStepTipBtns:@[@"get请求获取userInfo", @"post请求新增user"]];
}

- (void)buttonClickedWithTitle:(NSString *)title {
    if ([title isEqualToString:@"get请求获取userInfo"]) {
        [CusNetworkUserModel fetchUserData];
    } else if([title isEqualToString:@"post请求新增user"]) {
        CusNetworkUserModel *newUser = [[CusNetworkUserModel alloc] initWithDictionary:@{
            @"userId": @1200,
            @"name": @"章四",
            @"username": @"章流儿",
            @"email": @"mrzhanag@163.com"
        }];
        [CusNetworkUserModel addUserData:newUser];
    }
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
