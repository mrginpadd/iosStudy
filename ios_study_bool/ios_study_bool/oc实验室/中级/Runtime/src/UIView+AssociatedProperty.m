//
//  UIView+AssociatedProperty.m
//  ios_study_bool
//
//  Created by xushihao on 2024/12/31.
//

#import "UIView+AssociatedProperty.h"
#import <objc/runtime.h>
@implementation UIView(AssociatedProperty)

#pragma MARK- 关联对象分析
//1. 分类直接添加属性的后果
/*
 编译会出现警告：没有setter方法和getter方法
 运行时会报错：-[FXPerson setName:]: unrecognized selector sent to instance
 */

//2. 为什么不能直接添加属性
/*
 Category在runtime中是用一个结构体表示的：
 struct category_t {
     const char *name;
     classref_t cls;
     struct method_list_t *instanceMethods;
     struct method_list_t *classMethods;
     struct protocol_list_t *protocols;
     struct property_list_t *instanceProperties;
     // Fields below this point are not always present on disk.
     struct property_list_t *_classProperties;
     ...
 };
 里面虽然可以添加属性变量，但是这些properties并不会自动生成Ivar，也就是不会有 @synthesize的作用，dyld加载期间，这些分类会被加载并patch到相应的类中。
 这是一个动态过程，Ivar不能动态添加
 */
//3.解决方案

// 手动实现setter、getter方法，关联对象。
 - (void)setName:(NSString *)name {
     /*
     参数一：id object : 给哪个对象添加属性，这里要给自己添加属性，用self。
     参数二：void * == id key : 属性名，根据key获取关联对象的属性的值，在objc_getAssociatedObject中通过次key获得属性的值并返回。
     参数三：id value : 关联的值，也就是set方法传入的值给属性去保存。
     参数四：objc_AssociationPolicy policy : 策略，属性以什么形式保存。
    */
     objc_setAssociatedObject(self, @"name", name, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
 }

 - (NSString *)name {
    /*
     参数一：id object : 获取哪个对象里面的关联的属性。
     参数二：void * == id key : 什么属性，与objc_setAssociatedObject中的key相对应，即通过key值取出value。
     */
     return objc_getAssociatedObject(self, @"name");
 }

@end
