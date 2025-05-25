//
//  Demo07TableViewCell.m
//  ios_study_bool
//
//  Created by xushihao on 2025/5/25.
//

#import "Demo07TableViewCell.h"
#import <objc/runtime.h>
#define CASE 2
@implementation Demo07TableViewCell
/*
 在日常开发中, 我们往往会遇到一个场景, 一个同样的自定义 view 用于 cell 中和不用于 cell 中, 这时候我们会自定义一个 view 暴露如下图所示接口, 供外界调用。
 当我们使用这个 view 时候, 直接使用就可以了。但当需要该 view 嵌到 cell 中使用时, 还需要创建一个 cell 容器类, 将这个 view 添加进去, 而这个 cell 类其实仅仅作为添加 view 的容器, 本身并不具备什么逻辑, 当外界调用 cell 时, 它应该和 view 保持一样的接口如.h文件所示


 */
#if CASE == 1
// 传统的写法, 在 getter 、setter 方法实现中, 调用添加在自己中的 view 的对应方法即可
- (void)setMultipleChoice:(BOOL)multipleChoice {
    self.demoView.multipleChoice = multipleChoice;
}

- (BOOL)multipleChoice {
    return self.demoView.multipleChoice;
}
#elif CASE == 2

/*
但这里如果使用快速消息转发,  会是代码更加简洁, 我们仅需要在 - (id)forwardingTargetForSelector:(SEL)aSelector 方法中 return 加在自己中的自定义 view 对象即可, 当然这里要配合 @dynamic 关键字使用。因为 @property 关键字会生成对应的 getter 、setter 方法, 这样的话 cell 相当于实现了 getter 、setter 方法, 自然不会走到 - (id)forwardingTargetForSelector:(SEL)aSelector 中。
而 @dynamic 关键字意味着编译器不会帮助我们自动生成 getter 、setter 方法。这样一来, 相当于我们只申明了这些方法而并没有实现这些方法, 当调用时便会遵循消息转发机制的步骤, 从而调用 - (id)forwardingTargetForSelector:(SEL)aSelector。
*/

/*
 可以对比一下, 代码简洁了很多, 如果自定义 view 对外暴露的属性及方法更多, 这么写省去的代码就越多。后续如果需要增加对外暴露接口, 只需要在 .h 文件中添加对应接口, 如果是属性, .m 文件 @dynamic 关键字也要添加对应属性。
 */

@dynamic title, multipleChoice, maxChoiceNumber, didCommitBlock;

- (id)forwardingTargetForSelector:(SEL)selector {
    self.demoView = [[Demo07View alloc] init];
    return self.demoView;
}
#endif

@end
