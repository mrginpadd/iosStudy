//
//  CusRunTimeViewController.m
//  ios_study_bool
//
//  Created by xushihao on 2024/12/31.
//

#import "CusRunTimeViewController.h"
#import "IntroductionViewController.h"
#import <objc/runtime.h>
#import "ToastUtil.h"

#import "UIView+AssociatedProperty.h"


@interface CusRunTimeViewController ()<IntroductionViewControllerDelegate>

@end

@implementation CusRunTimeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    IntroductionViewController *vc = [[IntroductionViewController alloc] init];
    [self addChildViewController:vc];
    [self.view addSubview:vc.view];
    [vc didMoveToParentViewController:self];
    vc.delegate = self;
    
    vc.introTitleLabel.text = @"什么是Runtime（运行时） ? ";
    vc.introContentLabel.text = @" \n \
      Runtime是一套API (由C\C++\汇编实现，为OC语言加入了面向对象、运行时的功能) \n \
      Runtime 将数据类型的确定由编译时推迟到了运行时  \n \
      OC代码在程序运行的过程中，最终会转换成C代码  \n \
      例子： \n \
      read-only  在编译时已经确定  \n \
      read-write 在运行时才确定，因此可以使用Runtime进行修改 \n \
      \n \
      方法的本质是发送消息objc_msgSend，即寻找IMP（函数指针的过程）的过程 \n \
      发送消息会有以下几个流程： \n \
      1.快速查找流程-通过汇编objc_msgSend查找缓存cache_t是否有imp实现。\n \
      2.慢速查找流程-通过C++中lookUpImpOrForward递归查找当前类和父类的rw中methodlist的方法 \n \
      3.动态方法解析-通过调用resolveInstanceMethod和resolveClassMethod来动态方法决议-实现消息动态处理  \n \
      4.快速转发流程-通过CoreFoundation来触发消息转发流程，forwardingTargetForSelector实现快速转发 \n \
          由其它对象来实现处理方法  \n \
      5.慢速转发流程-先调用methodSignatureForSelector获取到方法的签名，生成对应的invocation;\n\
      再通过forwardInvocation来进行处理 \n \
      以上流程均无法挽救就崩溃报错  \n \
    \n \
     SEL和IMP的关系  \n \
     SEL是方法名、IMP是函数实现指针、找IMP就是找函数实现的过程  \n \
     SEL就相当于书本的目录标题 \n \
     IMP就是书本的页码 \n \
     函数就是具体页码对应的内容 \n \
    ";
    
    vc.userStepTitleLabel.text = @"能否向运行时创建的类中添加实例变量";
    vc.useStepContentLabel.text = @"\n \
    1.编译好的类不能添加实例变量  \n \
    2.运行时创建的类可以添加实例变量,但若已注册到内存中就不行了 \n \
    \n \
    原因:  \n \
    1.编译好的实例变量存储的位置在ro,而ro是在编译时就已经确定了的  \n \
    2.一旦编译完成，内存就够就完全确定无法修改  \n \
    3.只能修改rw中的方法或者通过关联对象的方式来添加属性 \n \
    ";
    
    vc.applicationTitleLabel.text = @"使用 Runtim-API";
    vc.applicationContentLabel.text = @" \n \
    1.动态创建类  \n \
    superClass: 父类，传Nil会创建一个新的根类 \n \
    name: 类名 \n \
    extraBytes: 额外的内存空间，一般传0  \n \
    return: 返回新类，创建失败返回Nil，如果类名已经存在，则创建失败 \n \
    Class FXPerson = objc_allocateClassPair([NSObject class], \"LGPerson\", 0);  \n \
    \n \
    2.添加成员变量  \n \
    这个函数只能在objc_allocateClassPair和objc_registerClassPair之间调用。不支持向现有类添加一个实例变量 \n \
    *这个类不能是元类，不支持在元类中添加一个实例变量 \n \
    cls 往哪个类添加 \n \
    name 添加的名字  \n \
    size 大小  \n \
    alignment \n \
    types 签名  \n \
    class_addIvar(FXPerson, \"fxName\", sizeof(NSString *), log2(sizeof(NSString *)), \"@\"  \n \
    \n \
    3.往内存注册类  \n \
    cls 要注册的类 \n \
    objc_registerClassPair(FXPerson); \n \
    4.添加属性变量  \n \
    往类里面添加属性 \n \
    cls 要添加属性的类 \n \
    name 属性名字 \n \
    attributes 属性的属性数组 \n \
    attriCount 属性中属性的数量 \n \
    class_addProperty(targetClass, propertyName, attrs, 4);  \n \
    \n \
    5.往类里添加方法 \n \
    cls 要添加方法的类 \n \
    sel 方法编号 \n \
    imp 函数实现指针 \n \
    types 签名 \n \
    class_addMethod(FXPerson, @selector(setHobby), (IMP)fxSetter, \"v@:@\") \n \
    ";
    
    [vc setUseStepTipBtns:@[@"动态创建类", @"关联对象添加属性"]];
    
    
}

#pragma MARK- Runtime动态创建类、属性、方法
// hobby的setter-IMP
void fxSetter(NSString *value) {
    printf("%s/n", __func__);
}

// hobby的getter-IMP
NSString *fxHobby(void) {
    return @"iOS";
}

// 添加属性变量的封装方法
void fx_class_addProperty(Class targetClass, const char *propertyName) {
    objc_property_attribute_t type = { "T", [[NSString stringWithFormat:@"@\"%@\"",NSStringFromClass([NSString class])] UTF8String] }; //type
    objc_property_attribute_t ownership0 = { "C", "" }; // C = copy
    objc_property_attribute_t ownership = { "N", "" }; //N = nonatomic
    objc_property_attribute_t backingivar  = { "V", [NSString stringWithFormat:@"_%@",[NSString stringWithCString:propertyName encoding:NSUTF8StringEncoding]].UTF8String };  //variable name
    objc_property_attribute_t attrs[] = {type, ownership0, ownership, backingivar};
    
    class_addProperty(targetClass, propertyName, attrs, 4);
}

// 打印属性变量的封装方法
void fx_printerProperty(Class targetClass) {
    unsigned int outCount, i;
    objc_property_t *properties = class_copyPropertyList(targetClass, &outCount);
    for(i=0; i<outCount; i++) {
        objc_property_t property = properties[i];
        fprintf(stdout, "%s %s\n", property_getName(property), property_getAttributes(property));
    }
}

- (void)buttonClickedWithTitle:(NSString *)title {
    if([title isEqualToString:@"动态创建类"]) {
        [self createClassByRuntime];
    } else if([title isEqualToString:@"关联对象添加属性"]) {
        [self createAssociatedPropertyByRuntime];
    }
}

// Runtime动态创建类
- (void)createClassByRuntime {
    //动态创建类
    Class FXPerson = objc_allocateClassPair([NSObject class], "FXPerson", 0);
    //添加成员变量
    class_addIvar(FXPerson, "name", sizeof(NSString *), log2(sizeof(NSString *)), "@");
    //注册到内存
    objc_registerClassPair(FXPerson);
    //添加属性变量
    fx_class_addProperty(FXPerson, "hobby");
    fx_printerProperty(FXPerson);
    //添加方法 （为属性方法添加setter、getter方法）
    class_addMethod(FXPerson, @selector(setHobby:), (IMP)fxSetter, "v@:@");
    class_addMethod(FXPerson, @selector(hobby), (IMP)fxHobby, "@@:");
    
    //开始使用
    id person = [FXPerson alloc];
    [person setValue:@"Felix" forKey:@"name"];
    NSLog(@"FXPerson的名字是：%@ 爱好是：%@", [person valueForKey:@"name"], [person valueForKey:@"hobby"]);
    
}

#pragma MARK - 关联对象创建属性
-(void)createAssociatedPropertyByRuntime {
    UIView *view = [[UIView alloc] init];
    //访问分类用关联对象创建的属性
    view.name = @"张三";
    [ToastUtil showToastCenter:view.name];
}



@end

