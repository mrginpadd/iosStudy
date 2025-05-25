//
//  Demo06ViewController.m
//  ios_study_bool
//
//  Created by xushihao on 2025/5/24.
//

#import "Demo06ViewController.h"
#import <objc/runtime.h>
#import "Student.h"
@interface Demo06ViewController ()

@end
/*
 当调用 [viewController playPiano]（实例方法）时，如果类没有这个方法，尝试动态添加。
 如果动态添加失败，则进入第二步：寻找“备胎对象”来处理。
 如果也没有备胎对象，则进入第三步：手动构造调用并转发给某个方法或对象。
 */

@implementation Demo06ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

#pragma mark - 第一步： 方法解析 resolveInstanceMethod
//判断当前对象是否能处理 sel

//类方法专用
+ (BOOL)resolveClassMethod:(SEL)sel {
//    NSString *method = NSStringFromSelector(sel);
//    if ([@"playPiano" isEqualToString:method]) {
//        class_addMethod(self, sel, (IMP)playPiano, "v");
//        return YES;
//    }
    return NO;
}

//实例方法专用
+ (BOOL)resolveInstanceMethod:(SEL)sel {
//    NSString *method = NSStringFromSelector(sel);
//    if ([@"playPiano" isEqualToString:method]) {
//        class_addMethod(self, sel, (IMP)playPiano, "v");
//        return YES;
//    }
    return NO;
}

// 动态添加的方法实现
//void playPiano(id self, SEL _cmd) {
//    NSLog(@"[Resolve] 动态添加的方法: %@", NSStringFromSelector(_cmd));
//}

#pragma mark - 第二步： 找备用  forwardingTargetForSelector
//当前的类不能够实现这个sel,但是检查是否有备胎可以实
- (id)forwardingTargetForSelector:(SEL)aSelector
{
//    NSString *seletorString = NSStringFromSelector(aSelector);
//    if ([@"playPiano" isEqualToString:seletorString]) {
//        NSLog(@"[ForwardingTarget] 将 playPiano 转发给 Student");
//        //如果当前类不能实现 playPanio的方法 ,消息转发给我的学生来实现.直接将该消息转给student类.
//        Student *s = [[Student alloc] init];
//        return s;
//    }
    // 继续转发
    return [super forwardingTargetForSelector:aSelector];
}

#pragma mark - 第三步: 首先获取当前的方法签名: Signature, 然后通过:
// (void)forwardInvocation:(NSInvocation *)anInvocation
// 进行消息转发:
- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector
{
    NSString *method = NSStringFromSelector(aSelector);
    if ([@"playPiano" isEqualToString:method]) {
        
        NSMethodSignature *signature = [NSMethodSignature signatureWithObjCTypes:"v@:@"];
        return signature;
    }
    return nil;
}

- (void)forwardInvocation:(NSInvocation *)anInvocation
{
    
    NSLog(@"[ForwardInvocation] 开始处理未识别的消息: %@", NSStringFromSelector(anInvocation.selector));
    
    SEL sel = @selector(travel:);
    NSMethodSignature *signature = [NSMethodSignature signatureWithObjCTypes:"v@:@"];
    anInvocation = [NSInvocation invocationWithMethodSignature:signature];
    [anInvocation setTarget:self];
    [anInvocation setSelector:@selector(travel:)];
    NSString *city = @"北京";
    // 消息的第一个参数是self，第二个参数是选择子，所以"北京"是第三个参数
    [anInvocation setArgument:&city atIndex:2];
    
    if ([self respondsToSelector:sel]) {
        [anInvocation invokeWithTarget:self];
        return;
    } else {
        Student *s = [[Student alloc] init];
        if ([s respondsToSelector:sel]) {
            [anInvocation invokeWithTarget:s];
            return;
        }
    }
    
    NSLog(@"[ForwardInvocation] 没有找到任何可以响应 playPiano 的目标");
    
    // 从继承树中查找
    [super forwardInvocation:anInvocation];
}

@end
