//
//  Demo05ViewController.m
//  ios_study_bool
//
//  Created by xushihao on 2025/5/24.
//

#import "Demo05ViewController.h"
#import "UIButton+CustomTag.h"
#import <objc/runtime.h>
@interface Demo05ViewController ()

@end

@implementation Demo05ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
#pragma mark- 场景1: 为已有类添加自定义属性(为分类添加属性)、使用关联对象传递数据
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.customTag = @"buttonTag";
    NSLog(@"button.customTag  = %@", button.customTag);

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
