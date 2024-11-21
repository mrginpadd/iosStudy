//
//  CusEventTransferViewController.m
//  ios_study_bool
//
//  Created by xushihao on 2024/2/15.
//

#import "CusEventTransferViewController.h"
#import "IntroductionViewController.h"
@interface CusEventTransferViewController ()

@end

@implementation CusEventTransferViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    IntroductionViewController *vc = [[IntroductionViewController alloc] init];
    [self.view addSubview:vc.view];
    [self addChildViewController:vc];
    [vc didMoveToParentViewController:self];
    
    vc.introContentLabel.text = @" \n \
iOS 的事件传递机制是基于响应者链（Responder Chain）的。当用户在屏幕上进行触摸操作或其他事件发生时，系统会生成对应的事件对象，并将其从\n \应用程序的主窗口开始沿着响应者链向下传递，直到找到能够处理该事件的对象为止。\n \
    \n \
以下是事件传递机制的基本原理：\n \
    \n \
主窗口接收事件： 事件首先被发送给应用程序的主窗口（UIWindow 对象），主窗口会调用\n \ hitTest:withEvent: 方法来确定哪个视图应该成为事件的初始接收者。\n \
    \n \
事件传递至视图层次结构： 从主窗口开始，事件会按照视图层次结构向下进行传递。每个视图都有一个 hitTest:withEvent:\n \ 方法，用于判断自身是否应该成为事件的接收者。如果视图能够处理事件，则事件会停止向下传递，否则会继续传递给视图层次结构中的下一个视图。\n \
    \n \
事件响应者链： 如果一个视图成为了事件的接收者，它会调用自己的\n \ touchesBegan:withEvent:、touchesMoved:withEvent:、touchesEnded:withEvent: 等方法来处理具体的触摸事件。如果视图无法处理事件，事件会继续向上传递到视图的父视图，直到找到能够处理事件的对象或者到达了响应链的末端。\n \
    \n \
事件传递至上层视图：\n \ 如果某个视图无法处理事件，事件会继续传递给其父视图，以此类推，直到事件被处理或传递到顶层视图（通常是视图控制器的根视图）。\n \
    \n \
如果事件未被处理：\n \ 如果事件传递到响应链的顶端仍然没有被处理，事件会被丢弃，不再进行传递。\n \
    \n \
    事件传递机制的核心在于事件的传递、响应和处理。  \n \
    事件传递的主要对象： UIResponder 、 UIWindow 、 UIView。\n \
    UIResponder \n \
    所有可以响应触摸事件的对象都是UIResponder类或其子类(如UIView、UIWindow、UIViewController的实例)。\n \
    \n \
    UIWindow  \n \
    UIWindow是 iOS应用的根视图，它负责接收并管理所有的触摸事件 \n \
    在事件传递过程中，UIWindow是事件流的起点。 \n \
    \n \
    UIView  \n \
    UIView是所有可视化元素的基类，每个视图都可能响应用户的触摸事件. \n \
    当用户触发触摸事件时，事件会传递到视图层级结构中的某个视图。 \n \
    事件传递的关键方法。\n \
    hitTest:withEvent:  \n \
    判断一个触摸事件是否击中该视图。每个视图都会调用这个方法来判断触摸是否发生在它的范围内。若视图的 hitTest 方法返回 nil，事件会被传递到下一个视图。 \n \
    \n \
    pointInside:withEvent: \n \
    用于判断一个特定的触摸点是否位于当前视图的可触摸区域内。如果返回 YES，表示触摸事件位于该视图内。   \n \
    nextResponder  \n \
    每个 UIResponder 对象都有一个 nextResponder 属性，它指向下一个响应者对象。当当前对象无法处理事件时，事件会传递给 nextResponder，通常是父视图或视图控制器。  \n \
\n \
    ";
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
