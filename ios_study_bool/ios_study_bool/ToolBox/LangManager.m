//
//  LangManager.m
//  ios_study_bool
//
//  Created by xushihao on 2024/1/20.
//

#import "LangManager.h"

@implementation LangManager

+ (void)perform: (LANGTYPE)type {
    switch(type) {
        case DEFINE:
            [self performDefine];
            break;
        case STR:
            [self performStr];
            break;
        case ARRAY:
            [self performArray];
            break;
        case DICTIONARY:
            [self performDic];
            break;
        default:
            break;
    }
    
}
+ (void) performDefine {
    
# pragma-mark 预定义宏的使用
    NSLog(@"预定义宏 _FILE_： 当前源文件的文件名%s ", __FILE__);
    NSLog(@"预定义宏 __LINE__： 当前代码行号%d ", __LINE__);
    NSLog(@"预定义宏 __FUNCTION__： 当前所在的函数名%s ", __FUNCTION__);
    NSLog(@"预定义宏 __PRETTY_FUNCTION__： 当前所在的函数名,更详细%s ", __PRETTY_FUNCTION__);
    NSLog(@"预定义宏 __IPHONE_OS_VERSION_MIN_REQUIRED: 标设备的最低iOS版本 %d ", __IPHONE_OS_VERSION_MIN_REQUIRED);
    NSLog(@"预定义宏 __IPHONE_OS_VERSION_MAX_ALLOWED: 当前编译环境支持的最高iOS版本%d  ", __IPHONE_OS_VERSION_MAX_ALLOWED);
    
    
}

+ (void)performStr {
# pragma-mark 字符串、数组、字典基本操作
    NSString *str = @"a string";
    //拼接
    str = [NSString stringWithFormat:@"b string %@", str];
    NSLog(@"%@", str);
    //子串
    NSLog(@"%@", [str substringFromIndex:1]);
    NSLog(@"%@", [str substringToIndex:5]);
    NSLog(@"%@", [str substringWithRange:NSMakeRange(1, 4)]);
    //访问
    NSLog(@"%c", [str characterAtIndex:0]);
    //反转
    //反转要自己实现
    NSLog(@"%@", [str uppercaseString]);
    NSLog(@"%@", [@"ABCdef" lowercaseString]);
    //比较
    NSLog(@"%@", [@"123" isEqualToString:@"123"] ? @"YES": @"NO");
    
    //查找
    NSRange range = [@"123456789" rangeOfString:@"123"];
    if (range.location != NSNotFound) {
        NSLog(@"not found");
    } else {
        NSLog(@"found");
    }
    
    //字符串分割
    NSArray *a = [@"1,2,3,4" componentsSeparatedByString:@","];
    for (NSString *str in a) {
        NSLog(@"%@", str);
    }
    
    //字符串替换
    NSLog(@"%@", [@"12345678" stringByReplacingOccurrencesOfString:@"456" withString:@"AAA"]);
}
+ (void)performArray {
    
    
    //数组基本操作
    
    //1.初始化
    NSArray* a = @[@1,@2,@3];
    NSArray* b = [[NSArray alloc] initWithArray:a];
    NSArray* c = [[NSArray alloc] initWithObjects:@1, @2, @3, @55, nil];
    NSMutableArray *ma = [@[@4,@5,@6] mutableCopy]; //mutableCopy方法创建一个可见副本
    
    
    //2.访问
    // for-in
    for (NSNumber* item in a) {
        NSLog(@"%@", item);
    }
    // for
    for (int i=0; i<a.count; i++) {
        NSNumber *number = a[i];
        NSLog(@"%@", number);
    }
    // 快速枚举
    [a enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSNumber* number = (NSNumber*)obj;
        NSLog(@"%lu  %@", idx, number);
    }];
    
    //3.查找
    NSLog(@"%@", [a containsObject:@1] ? @"true" : @"false");
    NSLog(@"%@", [a containsObject:@"122"] ? @"true" : @"false");
    
    //4.反转
    NSArray *reveresedA = [[a reverseObjectEnumerator] allObjects];
    NSLog(@"%@", reveresedA);
    
    //5.数组排序
    NSArray* sortedA = [a sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        return obj1 > obj2; //由小到大
    }];
    NSLog(@"数组排序： %@", sortedA);
    
    //6.插入移除元素
    [ma addObject:@9];
    [ma insertObject:@122 atIndex:0];
    NSLog(@"插入9: %@", ma);
    [ma removeObject:@9];
    [ma removeObjectAtIndex:0];
    NSLog(@"移除9: %@", ma);
}

+ (void)performDic {
    
//    字典基本操作
//    1.初始化
    NSDictionary *dict = @{@"name": @"周杰伦", @"age": @"41"};
    NSDictionary *dict2 = [NSDictionary dictionaryWithObjectsAndKeys:@"name", @"刘德华", @"age", @"60", nil];
    NSMutableDictionary *mdict = [dict mutableCopy];
    //2.访问
    NSLog(@"%@", dict[@"name"]);
    NSLog(@"%@", [dict2 objectForKey:@"name"]);
//    遍历
    [dict enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        NSLog(@"%@: %@", key, obj);
    }];

    //3.插入移除元素
    mdict[@"sex"] = @"男";
    NSLog(@"插入元素 %@", mdict);
    [mdict removeObjectForKey:@"age"];
    NSLog(@"移除元素 %@", mdict);
    
    [self func:12 p2:8 block:^(NSString *callBackVal) {
            NSLog(@"结果回调：%@", callBackVal);
    }];
}

typedef  void(^Block)(NSString *callBackVal);

+ (void)func:(int)a p2:(int)b block: (Block)block{
    NSLog(@"过程：%d+%d", a, b);
    block([NSString stringWithFormat:@"%d", a+b]);
}
@end
