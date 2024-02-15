
#import "TripleTapGestureRecognizer.h"

@interface TripleTapGestureRecognizer()
@property(nonatomic, assign, readwrite) NSInteger tapCount;
@end
@implementation TripleTapGestureRecognizer
- (instancetype)initWithTarget:(id)target action:(SEL)action {
    self = [super initWithTarget:target action:action];
    if (self) {
        _tapCount = 0;
    }
    return self;
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesEnded:touches withEvent:event];
    _tapCount++;
    
    if (_tapCount == 3) {
        [self setState:UIGestureRecognizerStateRecognized];
        _tapCount = 0;
    } else {
//        [self setState:UIGestureRecognizerStateFailed];
    }
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesCancelled:touches withEvent:event];
    _tapCount = 0;
}

@end
