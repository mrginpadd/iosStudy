//
//  CusArchiveViewController.m
//  ios_study_bool
//
//  Created by xushihao on 2024/2/18.
//

#import "CusArchiveViewController.h"
#import "IntroductionViewController.h"
#import "ToastUtil.h"
@interface CusArchiveViewController ()<IntroductionViewControllerDelegate>

@end

@implementation CusArchiveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    IntroductionViewController *vc = [[IntroductionViewController alloc] init];
    [self addChildViewController:vc];
    [self.view addSubview:vc.view];
    [vc didMoveToParentViewController:self];
    vc.delegate = self;
    
    vc.introTitleLabel.text = @"NSKeyedArchiver 和 NSKeyedUnarchiver介绍";
    vc.introContentLabel.text = @" \n \
    NSKeyedArchiver 和 NSKeyedUnarchiver 是 Cocoa 框架中提供的类，用于实现自定义对象的序列化和反序列化。 \n \
    它们通常一起使用，可以将对象序列化为二进制数据，也可以将二进制数据反序列化为对象。";
    
    vc.attributeContentLabel.text = @"\n \
    NSKeyedArchiver: 用于将对象序列化为二进制数据。 \n \
    NSKeyedUnarchiver: 用于将二进制数据反序列化为对象。 \n \
    ";
    
    vc.applicationContentLabel.text = @" \n \
    存储自定义对象到文件或内存中，并在需要时重新加载对象。 \n \
    将自定义对象传递给其他组件或远程服务。 \n \
    实现对象的深拷贝（deep copy）。 \n \
    ";
    
    vc.useStepContentLabel.text = @"\n \
    1.将需要序列化的类，遵守NSCoding协议，实现序列化和反序列化方法 \n \
    2.序列化对象到文件  \n \
    3.反序列化文件中的对象。\n \
    ";
    
    [vc setUseStepTipBtns:@[@"序列化对象到文件", @"反序列化文件中的对象"]];
    
    NSString *codeTip = @" \n \
    // 1.定义一个实现 NSCoding 协议的自定义类： \n \
    @interface Person : NSObject <NSCoding> \n \
    @property (nonatomic, strong) NSString *name;\n \
    @property (nonatomic, assign) NSInteger age;\n \
    @end \n \
            \n \
    @implementation Person\n \
    \n \
    - (void)encodeWithCoder:(NSCoder *)coder {\n \
        [coder encodeObject:self.name forKey:@\"name\"];\n \
        [coder encodeInteger:self.age forKey:@\"age\"];\n \
    }\n \
    \n \
    - (instancetype)initWithCoder:(NSCoder *)coder {\n \
        self = [super init];\n \
        if (self) {\n \
            self.name = [coder decodeObjectForKey:@\"name\"];\n \
            self.age = [coder decodeIntegerForKey:@\"age\"];\n \
        }\n \
        return self;\n \
    }\n \
    \n \
    //2.序列化对象到文件 \n \
    Person *person = [[Person alloc] init]; \n \
    person.name = @\"John\";  \n \
    person.age = 30; \n \
        \n \
    NSString *filePath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, \n \ NSUserDomainMask, YES).firstObject stringByAppendingPathComponent:@\"person.dat\"]; \n \
        \n \
    \n \
    [NSKeyedArchiver archiveRootObject:person toFile:filePath]; \n \
         \n \
    //3.反序列化文件对象 \n \
    NSString *filePath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, \n \ NSUserDomainMask, YES).firstObject stringByAppendingPathComponent:@\"person.dat\"]; \n \
         \n \
    Person *loadedPerson = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath]; \n \
    ";
    [vc setUseStepTipBtns:@[@"代码"] titles:@[@"代码"]  contents:@[codeTip]];

}

- (void)buttonClickedWithTitle:(NSString *)title {
    if ([title isEqualToString:@"序列化对象到文件"]) {
        [self archivePerson:^(void) {
           [ToastUtil showToastCenter:@"序列化person对象 name:John age: 30"];
        }];
    } else if([title isEqualToString:@"反序列化文件中的对象"]) {
        [self unArchivePerson:^(Person *person) {
            [ToastUtil showToastCenter:[NSString stringWithFormat:@"person对象：%@ %ld", person.name, (long)person.age]];
        }];
    }
}
// 序列化对象到文件：
- (void)archivePerson: (void(^)(void))completion {
    Person *person = [[Person alloc] init];
    person.name = @"John";
    person.age = 30;
    
    NSString *filePath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject stringByAppendingPathComponent:@"person.dat"];
    

    [NSKeyedArchiver archiveRootObject:person toFile:filePath];
    
    if (completion) {
        completion();
    }
}

// 反序列化文件中的对象
- (void)unArchivePerson: (void(^)(Person *person))completion {
    NSString *filePath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject stringByAppendingPathComponent:@"person.dat"];
    
    Person *loadedPerson = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
    if (completion) {
        completion(loadedPerson);
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


@implementation Person

- (void)encodeWithCoder:(NSCoder *)coder {
    [coder encodeObject:self.name forKey:@"name"];
    [coder encodeInteger:self.age forKey:@"age"];
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super init];
    if (self) {
        self.name = [coder decodeObjectForKey:@"name"];
        self.age = [coder decodeIntegerForKey:@"age"];
    }
    return self;
}

@end
