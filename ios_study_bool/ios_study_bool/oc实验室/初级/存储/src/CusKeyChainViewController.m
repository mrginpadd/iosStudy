//
//  CusKeyChainViewController.m
//  ios_study_bool
//
//  Created by xushihao on 2024/2/21.
//

#import "CusKeyChainViewController.h"
#import "IntroductionViewController.h"
#import "ToastUtil.h"
@interface CusKeyChainViewController ()<IntroductionViewControllerDelegate>

@end

@implementation CusKeyChainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    IntroductionViewController *vc = [[IntroductionViewController alloc] init];
    [self addChildViewController:vc];
    [self.view addSubview:vc.view];
    [vc didMoveToParentViewController:self];
    vc.delegate = self;
    
    vc.introTitleLabel.text = @"Keychain介绍";
    vc.introContentLabel.text = @"\n \
    iOS Keychain 是苹果的一种安全存储机制，用于存储应用程序的机密信息，例如用户名、密码、证书、API密钥等。 \n \
    Keychain 使用单独的加密存储，该存储由操作系统管理，从而保证了数据的安全性。\n \
    ";
    
    vc.attributeContentLabel.text = @" \n \
    1.kSecClass：指定要操作的 Keychain 项目的类型。常见的值包括： \n \
      kSecClassGenericPassword：用于存储用户名和密码。 \n \
      kSecClassInternetPassword：用于存储互联网密码。 \n \
      kSecClassCertificate：用于存储证书。 \n \
      kSecClassKey：用于存储私钥和公钥。 \n \
          \n \
    2.kSecAttrService:\n \
    指定了 Keychain 项目的服务标识符，通常用于区分不同的服务或应用程序。\n \
        \n \
    3.kSecAttrAccount：\n \
    指定了 Keychain 项目的账号标识符，用于唯一标识一个项目。\n \
        \n \
    4.kSecValueData \n \
    存储在 Keychain 中的数据。对于密码，可以使用 NSData 对象或 CFDataRef。\n \
         \n \
    5.kSecAttrAccessible \n \
    kSecAttrAccessibleWhenUnlocked：设备解锁后才能访问。\n \
    kSecAttrAccessibleAfterFirstUnlock：设备首次解锁后即可访问。\n \
    kSecAttrAccessibleAlways：始终可访问，即使设备被锁定。\n \
    kSecAttrAccessibleWhenPasscodeSetThisDeviceOnly：仅当设备设置了密码时才能访问。\n \
        \n \
    6.kSecAttrSynchronizable指定了 Keychain 项目是否可以与其他设备同步。常见的值包括： \n \
    kCFBooleanTrue：允许同步。\n \
    kCFBooleanFalse：不允许同步。\n \
    ";
    
    vc.applicationContentLabel.text = @"\n \
    存储用户账号密码 \n \
    存储应用程序的 API 密钥\n \
    存储证书和私钥\n \
    ";
    

    [vc setUseStepTipBtns:@[@"保存数据", @"读取", @"删除"]];
    
}
 
- (void)buttonClickedWithTitle:(NSString *)title {
    if ([title isEqualToString:@"保存数据"]) {
        
        if ([self saveDataToKeyChain:@"张三" val:@"pwd12345"]) {
            [ToastUtil showToastCenter:@"key: 张三 val: pwd12345"];
        } else {
            [ToastUtil showToastCenter:@"保存失败"];
        }
    } else if([title isEqualToString:@"读取"]) {
        NSString *res = [self readDataFromKeyChain:@"张三"];
        [ToastUtil showToastCenter:[NSString stringWithFormat:@"根据key读取到密码 %@", res]];
    } else if([title isEqualToString:@"删除"]) {
        if ([self deleteDataFromKeyChain:@"张三"]) {
            [ToastUtil showToastCenter:@"删除成功"];
        } else {
            [ToastUtil showToastCenter:@"删除失败"];
        }
    }
}

//保存数据到keyChain
- (BOOL)saveDataToKeyChain:(NSString*)key val:(NSString*)val {
    //将字符串转换为NSData
    NSData *valData = [val dataUsingEncoding:NSUTF8StringEncoding];
    
    //创建一个字典，用于存储KeyChain项
    NSDictionary *query = @{
        (__bridge  id)kSecClass: (__bridge  id)kSecClassGenericPassword, //设置为密码类
        (__bridge  id)kSecAttrAccount: key,
        (__bridge id)kSecValueData: valData
    };
    
    //先删除已有的记录
    SecItemDelete((__bridge CFDictionaryRef)query);
    //将数据添加到KeyChain
    OSStatus status = SecItemAdd((__bridge  CFDictionaryRef)query, NULL);
    
    return status == errSecSuccess;
}

//读取keyChain数据
- (NSString*)readDataFromKeyChain:(NSString*)key {
    //创建查询字典
    NSDictionary *query = @{
        (__bridge id)kSecClass: (__bridge  id)kSecClassGenericPassword, //设置为密码类
        (__bridge id)kSecAttrAccount: key, //设置账户名为key
        (__bridge id)kSecReturnData: (__bridge id)kCFBooleanTrue, //请求返回数据
        (__bridge id)kSecMatchLimit: (__bridge id)kSecMatchLimitOne //限制为一个结果
    };
    
    //查询KeyChain
    CFTypeRef result = NULL;
    OSStatus status = SecItemCopyMatching((__bridge CFDictionaryRef)query, &result);
    
    if (status == errSecSuccess) {
        //将返回的NSData转换为字符串
        NSData *data = (__bridge NSData*)result;
        return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    }
    return nil;
    
    
}

//删除keyChain数据
- (BOOL)deleteDataFromKeyChain:(NSString*)key {
    //创建查询字典
    NSDictionary *query = @{
        (__bridge id)kSecClass: (__bridge id)kSecClassGenericPassword,
        (__bridge id)kSecAttrAccount: key
    };
    
    //删除记录
    OSStatus status = SecItemDelete((__bridge  CFDictionaryRef)query);
    
    return status == errSecSuccess;
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
