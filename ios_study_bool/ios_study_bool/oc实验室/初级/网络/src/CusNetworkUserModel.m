//
//  CusNetworkUserModel.m
//  ios_study_bool
//
//  Created by xushihao on 2024/12/8.
//

#import "CusNetworkUserModel.h"

@implementation CusNetworkUserModel

// 用于从字典初始化User对象
- (instancetype)initWithDictionary:(NSDictionary *)dic {
    self = [super init];
    if (self) {
        self.name = dic[@"name"];
        self.username = dic[@"username"];
        self.email = dic[@"email"];
        self.userId = [dic[@"userId"] integerValue];
    }
    return self;
}
// 将User对象转换为字典
- (NSDictionary *)toDictionary {
    return @{
        @"userId": @(self.userId),
        @"name": self.name,
        @"username": self.username,
        @"email": self.email
    };
}
// 将User对象转换为Json数据
- (NSData *)toJson {
    NSDictionary *dict = [self toDictionary];
    NSError *error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dict options:0 error:&error];
    
    if (error) {
        //Json序列化失败
        return nil;
    }
    return jsonData;
}

// 获取用户数据
+ (void)fetchUserData {
    NSURL *url = [NSURL URLWithString:@"http://localhost:3000/api/getUserInfo"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"请求失败: %@", error.localizedDescription);
            return;
        }
        
        if (data) {
            NSError *jsonError = nil;
            
            // 解析 JSON 数据
            NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
            if (jsonError) {
                NSLog(@"JSON 解析失败: %@", jsonError.localizedDescription);
                return;
            }
            
            // 使用 User 的初始化方法从字典中创建 User 对象
            CusNetworkUserModel *user = [[CusNetworkUserModel alloc] initWithDictionary:jsonDict[@"userInfo"]];
            
            // 打印 User 对象信息
            NSLog(@"用户信息: %@, %@, %@, %@", @(user.userId), user.name, user.username, user.email);
        }
    }];
    
    [task resume];
}


+ (void)addUserData:(CusNetworkUserModel *)user {
    NSURL *url = [NSURL URLWithString:@"http://localhost:3000/api/addUserInfo"];
    
    //创建一个请求
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    //设置请求方式
    [request setHTTPMethod:@"POST"];
    //设置请求头
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];

    
    //将User对象转换为Json数据
    NSData *jsonData = [user toJson];
    [request setHTTPBody:jsonData];
    
    NSURLSessionDataTask *dataTask = [[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"Post请求失败");
            return;
        }
        NSError *jsonError;
        NSDictionary *responseDict = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        
        if (jsonError) {
            NSLog(@"解析失败 %@", jsonError.localizedDescription);
            return;
        }
        
        NSLog(@"成功创建User: %@", responseDict);
        
    }];
    
    [dataTask resume];
    
}


@end
