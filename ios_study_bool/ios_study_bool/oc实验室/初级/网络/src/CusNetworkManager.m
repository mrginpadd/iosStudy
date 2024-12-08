//
//  CusNetworkManager.m
//  ios_study_bool
//
//  Created by xushihao on 2024/12/8.
//

#import "CusNetworkManager.h"

@implementation CusNetworkManager
// 获取单例实例
+ (instancetype)sharedInstance {
    static CusNetworkManager *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[CusNetworkManager alloc] init];
    });
    return instance;
}

// GET 请求
- (NSURLSessionDataTask *)GET:(NSString *)url
                          parameters:(NSDictionary *)params
                          success:(void(^)(id responseObject))success
                      failure:(void(^)(NSError *error))failure {
    NSURL *requestURL = [NSURL URLWithString:url];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:requestURL];
    [request setHTTPMethod:@"GET"];
    
    //添加请求参数
    if (params) {
        NSString *queryString = [self queryStringFromParameters:params];
        NSString *fullURL = [url stringByAppendingFormat:@"?%@", queryString];
        request.URL = [NSURL URLWithString:fullURL];
    }
    
    //发起请求
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            //请求失败 , 调用failure
            failure(error);
        } else {
            //请求成功，解析返回数据
            id responseObject = [self parseJSON:data];
            success(responseObject);
        }
    }];
    
    //启动任务
    [task resume];
    
    return task;
}

// POST 请求
- (NSURLSessionDataTask *)POST:(NSString *)url
                          parameters:(NSDictionary *)params
                          success:(void(^)(id responseObject))success
                       failure:(void(^)(NSError *error))failure {
    
    //1.创建post请求
    NSURL *requestURL = [NSURL URLWithString:url];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:requestURL];
    [request setHTTPMethod:@"POST"];
    
    //2.添加请求参数
    if (params) {
        NSError *error;
        NSData *bodyData = [NSJSONSerialization dataWithJSONObject:params options:0 error:&error];
        if (error) {
            failure(error);
            return nil;
        }
        [request setHTTPBody:bodyData];
        [request setValue:@"application/json" forHTTPHeaderField:@"Content-type"];
    }
    
    //3.发起请求
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            //请求失败，调用failure
          failure(error);
        } else {
           //请求成功，解析返回数据
            id responseObject = [self parseJSON:data];
            success(responseObject);
        }
    }];
    
    [task resume];
    return task;
}

// 将字典参数转换为 URL 查询字符串
- (NSString *)queryStringFromParameters:(NSDictionary *)params {
    NSMutableArray *queryItems = [NSMutableArray array];
    
    for (NSString *key in params) {
        NSString *value = params[key];
        NSString *queryItem = [NSString stringWithFormat:@"%@=%@", key, value];
        [queryItems addObject:queryItem];
    }
    
    return [queryItems componentsJoinedByString:@"&"];
}

// 解析 JSON 数据
- (id)parseJSON:(NSData *)data {
    NSError *error;
    id json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
    if (error) {
        NSLog(@"JSON 解析失败: %@", error.localizedDescription);
        return nil;
    }
    return json;
}

@end
