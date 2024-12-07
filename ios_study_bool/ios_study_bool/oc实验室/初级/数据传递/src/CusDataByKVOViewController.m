//
//  CusDataByKVOViewController.m
//  ios_study_bool
//
//  Created by xushihao on 2024/12/7.
//

#import "CusDataByKVOViewController.h"


#pragma -mark 被观察的类
@interface DataModel : NSObject
@property(nonatomic, assign) NSInteger value; //被观察的属性
@end
@implementation DataModel
@end

#pragma -mark 观察者A的类
@interface ObserverA: NSObject
@property(nonatomic, assign) NSInteger observedValue;
- (void)setupKVOWithDataModel:(DataModel *)dataModel;
@end

@implementation ObserverA

- (void)setupKVOWithDataModel:(DataModel *)dataModel {
    [dataModel addObserver:self forKeyPath:@"value" options:NSKeyValueObservingOptionNew context:nil];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if ([keyPath isEqualToString:@"value"]) {
        NSNumber *newValue = change[NSKeyValueChangeNewKey];
        self.observedValue = newValue.integerValue;
        NSLog([NSString stringWithFormat:@"observerA 观察到DataModel的值发生了变化: %ld", (long)self.observedValue]);
    }
}

@end


#pragma -mark 观察者B的类
@interface ObserverB: NSObject
@property(nonatomic, assign) NSInteger observedValue;
- (void)setupKVOWithDataModel:(DataModel *)dataModel;
@end

@implementation ObserverB

- (void)setupKVOWithDataModel:(DataModel *)dataModel {
    [dataModel addObserver:self forKeyPath:@"value" options:NSKeyValueObservingOptionNew context:nil];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if ([keyPath isEqualToString:@"value"]) {
        NSNumber *newValue = change[NSKeyValueChangeNewKey];
        self.observedValue = newValue.integerValue;
        NSLog([NSString stringWithFormat:@"observerB 观察到DataModel的值发生了变化: %ld", (long)self.observedValue]);
    }
}

@end

@interface CusDataByKVOViewController ()
@property (nonatomic, strong) DataModel *dataModel;
@property (nonatomic, strong) ObserverA *observerA;
@property (nonatomic, strong) ObserverB *observerB;
@end

@implementation CusDataByKVOViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupViews];
}

- (void)setupViews {
    IntroductionViewController *vc = [[IntroductionViewController alloc] init];
    [self.view addSubview:vc.view];
    [self addChildViewController:vc];
    [vc didMoveToParentViewController:self];
    vc.delegate = self;
    
    vc.introTitleLabel.text = @"KVO";
    vc.introContentLabel.text = @"  \n \
    示例需求：  \n \
      我们有一个 DataModel 类，包含一个可以被 KVO 观察的属性 value。  \n \
      创建多个观察者（ObserverA 和 ObserverB）来观察 DataModel 类的 value 属性变化。  \n \
      当 value 属性发生变化时，所有观察者都能接收到通知并作出反应。  \n \
    ";
    vc.useStepContentLabel.text = @" \n \
    数据模型 DataModel：\n \
    \n \
    DataModel 类有一个 value 属性，可以通过 KVO 进行观察。 \n \
    @property 自动生成了 getter 和 setter 方法，KVO 会利用这些方法来监视属性值的变化。 \n \
        \n \
    观察者类 ObserverA 和 ObserverB：   \n \
        \n \
    每个观察者都通过 addObserver:forKeyPath:options:context: 方法注册对 DataModel 中 value 属性的观察。   \n \
    通过实现 observeValueForKeyPath:ofObject:change:context: 方法，观察者可以响应属性值的变化。   \n \
    在 dealloc 方法中，观察者被注销以避免内存泄漏。   \n \
    ViewController： \n \
    \n \
    在 viewDidLoad 中创建了 DataModel、ObserverA 和 ObserverB 实例。\n \
    使用 addObserver:forKeyPath: 方法为每个观察者注册了 KVO 监听。\n \
    模拟了 value 属性的变化，这样观察者就会接收到变化通知。\n \
    内存管理： \n \
    \n \
    在 dealloc 方法中，调用 removeObserver:forKeyPath: 方法移除观察者，以避免内存泄漏。 \n \
    确保每个观察者都在销毁前解除观察绑定。 \n \
    ";
    
    // 初始化数据模型和观察者
    self.dataModel = [[DataModel alloc] init];
    self.observerA = [[ObserverA alloc] init];
    self.observerB = [[ObserverB alloc] init];
        
    // 设置观察者
    [self.observerA setupKVOWithDataModel:self.dataModel];
    [self.observerB setupKVOWithDataModel:self.dataModel];
        
    // 模拟数据变化
    self.dataModel.value = 42;  // 观察者A和观察者B都会收到通知
    self.dataModel.value = 100; // 观察者A和观察者B都会收到通知
}


- (void)dealloc {
    // 移除观察者
    [self.dataModel removeObserver:self.observerA forKeyPath:@"value"];
    [self.dataModel removeObserver:self.observerB forKeyPath:@"value"];
    
    NSLog(@"ViewController deallocated");
}

@end
