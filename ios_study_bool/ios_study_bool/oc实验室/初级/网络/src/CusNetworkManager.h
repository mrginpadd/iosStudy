//
//  CusNetworkManager.h
//  ios_study_bool
//
//  Created by xushihao on 2024/12/8.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CusNetworkManager : NSObject

// 获取单例实例
+ (instancetype)sharedInstance;

// GET 请求
- (NSURLSessionDataTask *)GET:(NSString *)url
                          parameters:(NSDictionary *)params
                          success:(void(^)(id responseObject))success
                      failure:(void(^)(NSError *error))failure;

// POST 请求
- (NSURLSessionDataTask *)POST:(NSString *)url
                          parameters:(NSDictionary *)params
                          success:(void(^)(id responseObject))success
                       failure:(void(^)(NSError *error))failure;
@end

NS_ASSUME_NONNULL_END

// 获取单例实例
//NetworkManager *networkManager = [NetworkManager sharedInstance];

// GET 请求示例
//[networkManager GET:@"http://localhost:3000/api/getUserInfo"
//          parameters:@{@"param1": @"value1", @"param2": @"value2"}
//             success:^(id responseObject) {
//                 NSLog(@"GET 请求成功: %@", responseObject);
//             }
//             failure:^(NSError *error) {
//                 NSLog(@"GET 请求失败: %@", error.localizedDescription);
//             }];
//
//// POST 请求示例
//[networkManager POST:@"http://localhost:3000/api/addUserInfo"
//           parameters:@{@"key1": @"value1", @"key2": @"value2"}
//              success:^(id responseObject) {
//                  NSLog(@"POST 请求成功: %@", responseObject);
//              }
//              failure:^(NSError *error) {
//                  NSLog(@"POST 请求失败: %@", error.localizedDescription);
//              }];

