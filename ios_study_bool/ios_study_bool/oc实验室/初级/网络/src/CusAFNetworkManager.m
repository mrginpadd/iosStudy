//
//  CusAFNetworkManager.m
//  ios_study_bool
//
//  Created by xushihao on 2024/12/8.
//

#import "CusAFNetworkManager.h"

@implementation CusAFNetworkManager

//单例
+ (AFHTTPSessionManager *)sharedManager {
    static AFHTTPSessionManager *manager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [AFHTTPSessionManager manager];
        manager.responseSerializer = [AFHTTPResponseSerializer serializer];
        manager.requestSerializer = [AFHTTPRequestSerializer serializer];
        manager.requestSerializer.timeoutInterval = 30; //默认超时30秒
        manager.securityPolicy = [AFSecurityPolicy defaultPolicy]; //设置安全策略
    });
    
    return manager;
}

//GET请求
+ (void)getRequestWithURL:(NSString *)url parameters:(NSDictionary *)params success:(void (^)(id _Nonnull))success failure:(void (^)(NSError * _Nonnull))failure {
    [[self sharedManager] GET:url parameters:params headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(responseObject);
        }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            if (failure) {
                failure(error);
            }
     }];
}

//POST请求
+ (void)postRequestWithURL:(NSString *)url parameters:(NSDictionary *)params success:(void (^)(id _Nonnull))success failure:(void (^)(NSError * _Nonnull))failure {
    [[self sharedManager] POST:url parameters:params headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(responseObject);
        }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            if (failure) {
                failure(error);
            }
        }];
}

//上传文件
+ (void)uploadFileWithURL:(NSString *)url parameters:(NSDictionary *)params fileData:(NSData *)fileData fileName:(NSString *)fileName mimeType:(NSString *)mimeType success:(void (^)(id _Nonnull))success failure:(void (^)(NSError * _Nonnull))failure {
    [[self sharedManager] POST:url parameters:params headers:nil constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
            [formData appendPartWithFileData:fileData name:@"file" fileName:fileName mimeType:mimeType];
        } progress:nil
          success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            if (success) {
              success(responseObject);
            }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            if (failure) {
                failure(error);
            }
        }];
}

//下载文件
+ (void)downloadFileWithURL:(NSString *)url saveToPath:(NSString *)savePath progress:(void (^)(NSProgress * _Nonnull))progress success:(void (^)(id _Nonnull))success failure:(void (^)(NSError * _Nonnull))failure {
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    
    [[self sharedManager] downloadTaskWithRequest:request progress:nil destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
        return [NSURL fileURLWithPath:savePath];
    } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
        if(error) {
            if (failure) {
                failure(error);
            }
        } else {
            if (success) {
                success(filePath);
            }
        }
    }];
}
@end
