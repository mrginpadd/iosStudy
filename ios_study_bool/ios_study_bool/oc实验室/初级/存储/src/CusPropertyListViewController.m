//
//  CusPropertyListViewController.m
//  ios_study_bool
//
//  Created by xushihao on 2024/2/18.
//

#import "CusPropertyListViewController.h"
#import "IntroductionViewController.h"
#import "ToastUtil.h"
@interface CusPropertyListViewController ()<IntroductionViewControllerDelegate>

@end

@implementation CusPropertyListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    IntroductionViewController *vc = [[IntroductionViewController alloc] init];
    [self addChildViewController:vc];
    [self.view addSubview:vc.view];
    [vc didMoveToParentViewController:self];
    vc.delegate = self;
    
    vc.introTitleLabel.text = @"plist介绍";
    vc.introContentLabel.text = @"\n \
    iOS 中的 Property List（plist）是一种用来存储轻量级数据的文件格式， \n \
    它可以存储诸如数组、字典、字符串、日期、布尔值和二进制数据等基本类型的数据。 \n \
    Property List 可以使用 XML 或二进制格式进行存储，通常用于存储应用程序的配置信息、用户偏好设置以及静态数据。";
    
    NSString *infoPlistTip = @" \n \
    在 iOS 应用程序中，通常会包含一个名为 Info.plist 的默认 Property List 文件。  \n \
    Info.plist 文件是 iOS 应用程序的配置文件，其中包含了应用程序的各种配置信息和元数据，  \n \
    如应用程序的名称、版本号、图标文件名、支持的设备方向、权限申请等。  \n \
         \n \
    Info.plist 文件的作用包括但不限于： \n \
     \n \
    应用程序的基本信息配置：包括应用程序的名称、版本号、唯一标识符等。 \n \
    应用程序的图标和启动画面配置：指定应用程序的图标文件名、启动画面文件名等。 \n \
    权限申请配置：指定应用程序需要使用的各种权限，如相机、相册、位置信息等。 \n \
    URL Scheme 配置：用于处理应用程序的自定义 URL Scheme。 \n \
    设备方向配置：指定应用程序支持的设备方向。 \n \
    系统能力配置：指定应用程序需要使用的系统能力，如后台模式、推送通知等。 \n \
    Info.plist 文件是每个 iOS 应用程序必备的配置文件，它提供了应用程序运行所需的各种基本信息和配置。开发人员可以通过编辑 \n \ Info.plist 文件来配置应用程序的各项属性，以满足应用程序的需求和功能。 \n \
    ";
    [vc setIntroTipBtns:@[@"Info.plist"] titles:@[@"Info.plist文件"] contents:@[infoPlistTip]];
    
    vc.applicationContentLabel.text = @" \n \
    应用程序的配置信息，如服务器地址、API密钥等。\n \
    存储用户的偏好设置，如主题颜色、字体大小等。\n \
    存储静态数据，如国家列表、城市信息等。\n \
    用于数据持久化，如缓存数据或临时数据的存储。\n \
    ";
    
    vc.useStepContentLabel.text = @" \n \
      // 获取 Info.plist 文件路径\n \
      NSString *plistPath = [[NSBundle mainBundle] pathForResource:@\"Info\" ofType:@\"plist\"];\n \
      \n \
      // 读取 Info.plist 文件中的属性\n \
      NSDictionary *infoDict = [NSDictionary dictionaryWithContentsOfFile:plistPath];\n \
      \n \
      // 读取应用程序名称\n \
      NSString *appName = infoDict[@\"CFBundleDisplayName\"];\n \
    ";
    [vc setUseStepTipBtns:@[@"读取info.plist文件"]];
    
    
}

- (void)buttonClickedWithTitle:(NSString *)title {
    if ([title isEqualToString:@"读取info.plist文件"]) {
        [self readInfoPlistFile:^(NSString *content) {
           [ToastUtil showToastCenter:[NSString stringWithFormat:@"appName: %@", content]];
        }];
    }
}

- (void)readInfoPlistFile:(void(^)(NSString *content))completion {
    // 获取 Info.plist 文件路径
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"Info" ofType:@"plist"];

    // 读取 Info.plist 文件中的属性
    NSDictionary *infoDict = [NSDictionary dictionaryWithContentsOfFile:plistPath];

    // 读取应用程序名称
    NSString *appName = infoDict[@"CFBundleDisplayName"];

    if (completion) {
        completion(appName);
    }
 
}


@end
