//
//  CusThreadAsync.m
//  ios_study_bool
//
//  Created by xushihao on 2024/12/8.
//

#import "CusThreadAsyncViewController.h"
#import "ToastUtil.h"

@interface CusMyOperation : NSOperation

@end

@implementation CusMyOperation

- (void)main {
    @autoreleasepool {
        if (self.isCancelled) {
            return; //如果操作被取消，退出
        }
        //执行具体任务
        NSLog(@"NSOperation: 比较复杂的操作");
    }
}

@end

@implementation CusThreadAsyncViewController

- (void)viewDidLoad {
    [self setupViews];
}

- (void)setupViews {
    IntroductionViewController *vc = [[IntroductionViewController alloc] init];
    [self addChildViewController:vc];
    [self.view addSubview:vc.view];
    [vc didMoveToParentViewController:self];
    vc.delegate = self;
    
    vc.introTitleLabel.text = @"多线程与异步";
    vc.introContentLabel.text = @" \n \
    多线程和异步编程是提高应用程序性能和响应速度的重要技术。它们帮助我们避免主线程被阻塞，从而保持界面的流畅和及时响应用户操作。\n \
    多线程 \n \
    多线程 是指在同一个应用程序中，创建多个线程来并发执行任务。每个线程都有自己的执行路径，CPU 可以根据需要在多个线程之间切换，从而实现任务并行处理。 \n \
    线程的类型： \n \
    主线程 (Main Thread)：也称 UI 线程，是默认的线程，用于执行用户界面相关的任务，所有 UI 操作都必须在主线程上执行。 \n \
    子线程 (Background Thread)：用于执行耗时操作，避免阻塞主线程。子线程通常用于网络请求、文件处理等耗时任务。 \n \
    \n \
    使用多线程的目的：  \n \
    提高性能：通过并行处理任务，可以有效地缩短任务的总时间。  \n \
    避免 UI 阻塞：UI 线程（主线程）用于处理界面和用户交互，而耗时任务（如网络请求）应在后台线程处理，避免阻塞 UI。 \n \
常见的线程操作方式： \n \
NSThread：原生的线程类，用于手动创建和管理线程。   \n \
GCD (Grand Central Dispatch)：Apple 提供的多线程技术，简化了并发编程，使用起来比 NSThread 更为高效。  \n \
NSOperation 和 NSOperationQueue：基于 GCD 实现的高级抽象，可以更方便地管理和控制任务的执行。 \n \
     \n \
     \n \
    异步   \n \
    异步编程 是指发起一个任务时，不需要等待其完成就可以继续执行其他代码。当任务完成时，系统会通知应用程序并执行相应的回调或完成处理。异步操作通常和多线程一起使用。 \n \
    异步与同步的区别  \n \
    同步 \n \ (Synchronous)：在调用一个任务时，程序会等待任务完成后再继续执行下一步操作。比如执行一个网络请求时，程序会等待请求返回结果，期间无法执行其他操作。 \n \
    // 同步方式（阻塞当前线程） \n \
    NSString *result = [self synchronousTask]; \n \
    NSLog(@\"Result: %@\", result); \n \
        \n \
    异步\n \ (Asynchronous)：在调用一个任务时，程序不会等待任务完成，而是立即执行下一步操作。任务完成时会通过回调通知应用，继续执行后续操作。\n \
    // 异步方式（非阻塞当前线程）\n \
    [self asynchronousTaskWithCompletion:^(NSString *result) {\n \
        NSLog(@\"Result: %@\", result);\n \
    }];\n \
    异步编程的好处：  \n \
    提高响应性：主线程可以继续处理用户的操作，不会因为等待任务的完成而被阻塞。  \n \
    提高效率：通过异步执行，可以同时执行多个任务，节省时间。  \n \
         \n \
    GCD (Grand Central Dispatch) \n \
    GCD 是 Apple 提供的一种高效的多线程技术，它通过任务队列来管理并发执行的任务。GCD 简化了线程管理，开发者无需显式地创建和管理线程。GCD 会自动根据系统的资源来调度任务。\n \
        \n \
    GCD 的常用方法\n \
    Dispatch Queue（调度队列）：GCD 使用队列来管理任务，任务按顺序执行。\n \
    \n \
    串行队列 (Serial Queue)：每次只执行一个任务。\n \
    并行队列 (Concurrent Queue)：多个任务可以并行执行。\n \
    // 串行队列\n \
    dispatch_queue_t serialQueue = dispatch_queue_create(\"com.example.serialQueue\", DISPATCH_QUEUE_SERIAL);\n \
    \n \
    // 并行队列\n \
    dispatch_queue_t concurrentQueue =\n \ dispatch_queue_create(\"com.example.concurrentQueue\", DISPATCH_QUEUE_CONCURRENT);\n \
    \n \
    同步和异步执行任务： \n \
    同步执行 (dispatch_sync)：同步任务会在当前线程上阻塞，直到任务执行完毕。 \n \
    异步执行 (dispatch_async)：异步任务不会阻塞当前线程，任务会在后台执行，执行完后通过回调返回结果。\n \
    // 异步执行任务（在背景队列上执行） \n \
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{\n \
        // 执行耗时操作\n \
        NSLog(@\"Background task\");\n \
    });\n \
    \n \
    // 回到主线程更新 UI\n \
    dispatch_async(dispatch_get_main_queue(), ^{\n \
        // 更新 UI\n \
        NSLog(@\"Back to main thread\");\n \
    });\n \
    延迟执行： \n \
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 3 * NSEC_PER_SEC), \n \ dispatch_get_main_queue(), ^{\n \
        // 3秒后执行\n \
        NSLog(@\"Executed after delay\");\n \
    });\n \
        \n \
    GCD 常见应用：\n \
    并发任务：多个任务可以并行执行，节省时间。\n \
    任务调度：使用 GCD 的队列机制控制任务的执行顺序。\n \
    UI 更新：异步任务完成后，更新 UI 必须在主线程中进行。\n \
    \n \
    \n \
    NSOperation 和 NSOperationQueue   \n \
    NSOperation 是一个比 GCD 更高级的抽象，它封装了任务和任务的依赖关系，支持任务的取消、优先级和状态管理。NSOperationQueue 可以管理多个 NSOperation 对象。\n \
    NSOperation：表示一个单独的任务，可以是同步或异步的。\n \
    NSOperationQueue：用于管理多个 NSOperation，并控制其并发执行。\n \
    // 创建一个 NSOperationQueue\n \
    NSOperationQueue *operationQueue = [[NSOperationQueue alloc] init];\n \
    \n \
    // 创建一个操作（可以是同步或异步）\n \
    NSBlockOperation *operation = [NSBlockOperation blockOperationWithBlock:^{\n \
        NSLog(@\"Task is running\");\n \
    }];\n \
    \n \
    // 向队列中添加操作\n \
    [operationQueue addOperation:operation];\n \
    \n \
    \n \
    主线程与后台线程 \n \
    主线程：负责更新 UI 和处理用户交互，所有 UI 操作必须在主线程中执行。\n \
    后台线程：用于执行耗时任务，如网络请求、文件操作、数据库查询等。\n \
    通常，耗时操作应在后台线程执行，任务完成后再返回主线程更新 UI。例如：\n \
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{\n \
        // 在后台线程执行耗时任务\n \
        [self loadData];\n \
        \n \
        // 回到主线程更新 UI\n \
        dispatch_async(dispatch_get_main_queue(), ^{\n \
            // 更新 UI\n \
            [self updateUI];\n \
        });\n \
    });\n \
    总结\n \
    多线程：用于并行处理多个任务，避免阻塞主线程。iOS 提供了 NSThread、GCD 和 NSOperation 等方式来实现多线程。\n \
    异步：任务执行时不阻塞当前线程，任务执行完后通过回调通知。异步操作通常在后台线程执行，主线程用于处理 UI 更新。\n \
    GCD：是一种非常高效的多线程实现，通过队列来管理任务的并发执行，简化了线程管理。\n \
    NSOperation：基于 GCD 提供了更高级的抽象，允许管理任务的依赖关系和优先级，适合复杂的并发操作。\n \
    使用 GCD 和 NSOperation 结合主线程和后台线程，可以让你的应用更加高效和响应迅速，避免因任务执行过慢导致的界面卡顿或阻塞\n \
    ";
    
    vc.useStepContentLabel.text = @" \n \
    NSThread 是 iOS 中用于处理多线程编程的一个类，它允许你创建和管理线程。  \n \
    通过NSThread，你可以将耗时的任务从主线程中分离出来，避免阻塞 UI 响应。 \n \
    1. 创建 NSThread 实例 \n \
    NSThread *thread = [[NSThread alloc] initWithTarget:self  \n \ selector:@selector(runInBackground) object:nil];  \n \
    2. 启动线程  \n \
    [thread start];  \n \
    3. 实现要执行的方法  \n \
    - (void)runInBackground {  \n \
        // 在此执行耗时操作  \n \
    }  \n \
    4. 使用 NSThread 直接执行代码 \n \
    可以使用 NSThread 提供的类方法来直接执行一个方法。这样不需要手动创建线程实例。 \n \
    // 直接在子线程中执行方法   \n \
    [NSThread detachNewThreadSelector:@selector(runInBackground) toTarget:self  \n \ withObject:nil]; \n \
         \n \
    5. 主线程与子线程的交互  \n \
    你可能需要在子线程完成后与主线程进行交互。例如，你可能需要更新 UI，这就需要将更新 UI 的代码放回主线程执行。你可以通过 performSelectorOnMainThread 方法来实现。 \n \
    - (void)runInBackground { \n \
        // 在子线程做一些工作 \n \
        \n \
        // 回到主线程更新 UI\n \
        [self performSelectorOnMainThread:@selector(updateUI) withObject:nil\n \ waitUntilDone:NO];\n \
    }\n \
        \n \
    - (void)updateUI {\n \
        // 更新 UI\n \
    }\n \
    \n \
    6. 判断当前线程 \n \
    使用 isMainThread 和 currentThread 来判断当前线程。  \n \
    if ([NSThread isMainThread]) {  \n \
        //This is the main thread. \n \
    } else { \n \
        //This is a background thread.  \n \
    }   \n \
    7. 控制线程的执行（线程暂停、停止等）  \n \
    NSThread 提供了一些方法来控制线程的暂停和停止。例如： \n \
    \n \
    sleepForTimeInterval:：使当前线程暂停指定的时间。\n \
    cancel：标记线程为取消状态（但线程的执行方法内需要手动检查是否取消）。\n \
    - (void)runInBackground {\n \
        // 进行一些处理\n \
        if ([NSThread currentThread].isCancelled) {\n \
            return;  // 可以检查线程是否被取消\n \
        }\n \
            \n \
        // 线程暂停 2 秒\n \
        [NSThread sleepForTimeInterval:2.0];\n \
            \n \
        // 继续执行  \n \
    }\n \
    \n \
    GCD（Grand Central Dispatch） 是一个强大的并发编程工具，可以用来管理多线程任务的执行。 \n \
    GCD 提供了简单的 API 来在不同的队列（dispatch_queue）上执行任务，确保在多核设备上最大化并发性。 \n \
    通过 GCD，你可以轻松地执行并发任务、定时任务以及异步任务。  \n \
    使用 GCD 的基本步骤： \n \
    1.选择队列类型 \n \
    GCD 提供了两种类型的队列：串行队列（Serial Queue）和 并行队列（Concurrent Queue）。\n \
    串行队列：任务按顺序执行，一个接一个。\n \
    并行队列：多个任务可以并行执行，系统根据 CPU 核心数来决定同时执行多少任务。\n \
         \n \
    2.提交任务到队列 \n \
    使用 dispatch_async（异步执行）或者 dispatch_sync（同步执行）将任务提交到队列。 \n \
        \n \
    3.管理任务 \n \
    在 GCD 中，任务被封装为 block，任务执行时可以传递相关的上下文。 \n \
    \n \
    GCD 使用步骤  \n \
    1. 创建队列   \n \
    GCD 提供了几种内置的队列类型：   \n \
     \n \
    主队列（Main Queue）：这个队列用于更新 UI，它是一个串行队列，任务按顺序执行。 \n \
    全局并行队列（Global Concurrent Queue）：是并行队列，适合执行高耗时任务。 \n \
    自定义队列（Custom Queue）：你也可以创建自己的串行队列或者并行队列。 \n \
    创建自定义队列的方法： \n \
    // 创建一个串行队列   \n \
    dispatch_queue_t serialQueue = dispatch_queue_create(\"com.example.serialQueue\", DISPATCH_QUEUE_SERIAL);   \n \
     \n \
    // 创建一个并行队列 \n \
    dispatch_queue_t concurrentQueue =  \n \ dispatch_queue_create(\"com.example.concurrentQueue\", DISPATCH_QUEUE_CONCURRENT);  \n \
     \n \
    2. 提交任务到队列   \n \
    通过 dispatch_async 提交异步任务，或者通过 dispatch_sync 提交同步任务。   \n \
    异步执行任务（推荐用于并发任务）：\n \
    dispatch_async(serialQueue, ^{ \n \
        // 任务 1 \n \
         Task 1 - Serial Queue \n \
    });\n \
        \n \
    dispatch_async(concurrentQueue, ^{\n \
        // 任务 2\n \
         Task 2 - Concurrent Queue \n \
    });\n \
    \n \
    \n \
    同步执行任务（任务会阻塞当前线程，通常不要在主线程使用）：  \n \
    dispatch_sync(serialQueue, ^{  \n \
        // 任务 1   \n \
        Task 1 - Serial Queue  \n \
    }); \n \
    dispatch_sync(serialQueue, ^{  \n \
        // 任务 2   \n \
        Task 2 - Serial Queue  \n \
    }); \n \
    主队列（用于 UI 更新）： \n \
    dispatch_async(dispatch_get_main_queue(), ^{  \n \
        // 在主线程执行的任务（比如 UI 更新）  \n \
        Task on main queue   \n \
    });  \n \
    3. 使用 dispatch_after 延时执行任务  \n \
    dispatch_time_t delayTime = dispatch_time(DISPATCH_TIME_NOW, 3.0 * NSEC_PER_SEC); // 延迟 3 秒  \n \
    dispatch_after(delayTime, dispatch_get_main_queue(), ^{  \n \
        // 延迟执行的任务  \n \
        Task executed after delay \n \
    });\n \
    \n \
    4. 使用 dispatch_group 组合任务  \n \
    如果你有多个任务需要并行执行，并且需要在所有任务完成后执行某个任务，可以使用 dispatch_group：  \n \
    dispatch_group_t group = dispatch_group_create();  \n \
    \n \
    // 异步任务 1\n \
    dispatch_group_async(group,\n \ dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{\n \
        // Task 1\n \
    }); \n \
    \n \
    // 异步任务 2\n \
    dispatch_group_async(group,\n \ dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{\n \
        // Task 2\n \
    }); \n \
        \n \
    // 当所有任务完成时执行的任务  \n \
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{ \n \
        All tasks are completed  \n \
    });\n \
        \n \
    5. 使用 dispatch_once 执行一次性任务\n \
    dispatch_once 用于确保某个任务只执行一次，通常用于初始化操作。 \n \
    static dispatch_once_t onceToken; \n \
    dispatch_once(&onceToken, ^{ \n \
        // 只执行一次的任务 \n \
        This is executed only once \n \
    });\n \
    \n \
    ";
    
    
    
    [vc setUseStepTipBtns:@[@"NSThread", @"GCD", @"NSOperation"]];
    
}

- (void)buttonClickedWithTitle:(NSString *)title {
    if ([title isEqualToString:@"NSThread"]) {
        [self testThread];
    } else if([title isEqualToString:@"GCD"]) {
        [self testGCD];
    } else if([title isEqualToString:@"NSOperation"]) {
        [self testNSOperation];
    }
}

#pragma -mark NSThread
- (void)testThread {
    //1.创建线程
    NSThread *thread = [[NSThread alloc] initWithTarget:self selector:@selector(runInBackground) object:nil];
    //2.启动线程
    NSLog(@"testThread: 启动线程 %f", [[NSDate date] timeIntervalSince1970]);
    [thread start];
    
}

- (void)runInBackground {
    
    //耗时操作
    for (int i=0; i<100000; i++) {
        
    }
    [self performSelectorOnMainThread:@selector(updateUI) withObject:nil waitUntilDone:NO];
    NSLog(@"testThread: 耗时操作是否在主线程： %d", [NSThread isMainThread]);
    
    NSLog(@"testThread: 耗时操作执行完毕 %f", [[NSDate date] timeIntervalSince1970]);
}

- (void)updateUI {
    NSLog(@"testThread: 更新UI操作是否在主线程： %d", [NSThread isMainThread]);
    
    [ToastUtil showToastCenter:@"耗时操作执行完毕"];
}

#pragma -mark GCD

- (void)testGCD {
    //1.创建串行 或 并行 队列
    dispatch_queue_t serialQueue = dispatch_queue_create(@"com.example.serialQueue", DISPATCH_QUEUE_SERIAL);
    
    dispatch_queue_t concurrentQueue = dispatch_queue_create(@"com.example.concurrentQueue", DISPATCH_QUEUE_CONCURRENT);
    
    //2.提交任务到队列
    //串行队列  任务按顺序执行
    dispatch_async(serialQueue, ^{
        NSLog(@"GCD串行队列 Task1");
    });
    dispatch_async(serialQueue, ^{
        sleep(2);
        NSLog(@"GCD串行队列 Task2");
    });
    dispatch_async(serialQueue, ^{
        NSLog(@"GCD串行队列 Task3");
    });
    
    //并行队列 多个任务并行执行
    dispatch_async(concurrentQueue, ^{
        sleep(2);
        NSLog(@"GCD并行队列 Task1");
    });
    dispatch_async(concurrentQueue, ^{
        NSLog(@"GCD并行队列 Task2");
    });
    dispatch_async(concurrentQueue, ^{
        NSLog(@"GCD并行队列 Task3");
    });
    
    //主队列  用于UI更新
    dispatch_async(dispatch_get_main_queue(), ^{
        //UI更新操作
        NSLog(@"GCD主队列 Task");
    });
    
    //使用 dispatch_after 延时执行任务
    dispatch_time_t delayTime = dispatch_time(DISPATCH_TIME_NOW, 3.0 * NSEC_PER_SEC);
    dispatch_after(delayTime, dispatch_get_main_queue(), ^{
        //延迟执行的任务
        NSLog(@"GCD延时执行 Task");
    });
    
    //使用 dispatch_group 组合任务
    //如果你有多个任务需要并行执行，并且需要在所有任务完成后执行某个任务，可以使用 dispatch_group：
    dispatch_group_t group = dispatch_group_create();
    //异步任务 1
    dispatch_group_async(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
       //Task 1
        sleep(2);
        NSLog(@"GCD dispatch_group Task1");
    });
    //异步任务 2
    dispatch_group_async(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
       //Task 2
        NSLog(@"GCD dispatch_group Task2");
    });
    //异步任务 3
    dispatch_group_async(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
       //Task 3
        NSLog(@"GCD dispatch_group Task3");
    });
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        NSLog(@"GCD dispatch_group 所有任务都完成");
    });
    
    //5. 使用 dispatch_once 执行一次性任务
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSLog(@"GCD dispatch_once_t 只执行一次的任务");
    });
}

#pragma -mark NSOperation


- (void)testNSOperation {
//    在 iOS 中，NSOperation 是一种用于执行任务的抽象类，它提供了一种比 GCD 更高级的任务管理方式，适合在多线程环境下管理复杂的操作。使用 NSOperation 和 NSOperationQueue 可以轻松实现任务的并发和串行执行、依赖关系管理、优先级控制等。
    
    //1.使用NSBlockOperation(简便方式)
    NSBlockOperation *operation = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"NSOperation: Task1");
    }];
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    [queue addOperation:operation];
    
    //2.使用自定义的NSOperation子类 (更灵活)
    //如果任务比较复杂，可以创建一个继承自 NSOperation 的子类，并重写 main 方法。
    CusMyOperation *myOperation = [[CusMyOperation alloc] init];
    NSOperationQueue *myQueue = [[NSOperationQueue alloc] init];
    [myQueue addOperation:myOperation];
    
    //操作的依赖关系
    NSOperation *operation1 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"NSOperation: 依赖关系 Task1");
    }];
    NSOperation *operation2 = [NSBlockOperation blockOperationWithBlock:^{
        sleep(2);
        NSLog(@"NSOperation: 依赖关系 Task2");
    }];
    NSOperation *operation3 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"NSOperation: 依赖关系 Task3");
    }];
    [operation2 addDependency:operation1];
    [operation3 addDependency:operation2];
    NSOperationQueue *operationsQueue = [[NSOperationQueue alloc] init];
    [operationsQueue addOperation:operation1];
    [operationsQueue addOperation:operation2];
    [operationsQueue addOperation:operation3];
    
    //操作完成的回调
    NSBlockOperation *operation4 = [NSBlockOperation blockOperationWithBlock:^{
        sleep(1);
        NSLog(@"NSOperation: 操作完成的回调 Task1");
    }];
    operation4.completionBlock = ^{
        NSLog(@"NSOperation: 操作完成的回调 回调Task");
    };
    NSOperationQueue *queue4 = [[NSOperationQueue alloc] init];
    [queue4 addOperation:operation4];
}
@end
