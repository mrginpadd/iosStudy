
#import "TripleTapGestureRecognizer.h"

@interface TripleTapGestureRecognizer()
@property(nonatomic, assign, readwrite) NSInteger tapCount;
@property(nonatomic, strong) NSDate *lastTapTime;
@end
@implementation TripleTapGestureRecognizer
- (instancetype)initWithTarget:(id)target action:(SEL)action {
    self = [super initWithTarget:target action:action];
    if (self) {
        _tapCount = 0;
        _lastTapTime = nil;
    }
    return self;
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesEnded:touches withEvent:event];
    
    //获取当前点击的时间
    NSDate *now = [NSDate date];
    
    if (_lastTapTime) {
        NSTimeInterval timeInterval = [now timeIntervalSinceDate:_lastTapTime];
        // 如果两次点击的时间超过 0.5s
        if (timeInterval > 0.5) {
            _tapCount = 0; //超过阈值，重新计数
        }
    }
    _tapCount++;
    
    if (_tapCount == 3) {
        [self setState:UIGestureRecognizerStateRecognized];
        _tapCount = 0;
    } else {
        [self setState:UIGestureRecognizerStateFailed];
        [self shouldRequireFailureOfGestureRecognizer:self];
    }
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesCancelled:touches withEvent:event];
    _tapCount = 0;
}

@end
