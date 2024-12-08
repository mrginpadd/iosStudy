//
//  CusAFNetworkManager.h
//  ios_study_bool
//
//  Created by xushihao on 2024/12/8.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>
NS_ASSUME_NONNULL_BEGIN

@interface CusAFNetworkManager : NSObject

//单例
+ (AFHTTPSessionManager *)sharedManager;

//GET请求
+ (void)getRequestWithURL:(NSString *)url
        parameters:(NSDictionary *)params
        success:(void(^)(id responseObject))success
        failure:(void(^)(NSError *error))failure;

//POST请求
+ (void)postRequestWithURL:(NSString *)url
        parameters:(NSDictionary *)params
        success:(void(^)(id responseObject))success
        failure:(void(^)(NSError *error))failure;

//上传文件
+ (void)uploadFileWithURL:(NSString *)url
        parameters:(NSDictionary *)params
        fileData:(NSData *)fileData
        fileName:(NSString *)fileName
        mimeType:(NSString *)mimeType
        success:(void(^)(id responseObject))success
        failure:(void(^)(NSError *error))failure;

//下载文件
+ (void)downloadFileWithURL:(NSString *)url
        saveToPath:(NSString *)savePath
        progress:(void(^)(NSProgress *downloadProgress))progress
        success:(void(^)(id responseObject))success
        failure:(void(^)(NSError *error))failure;
@end

NS_ASSUME_NONNULL_END

//使用示例

//[NetworkTool getRequestWithURL:@"https://api.example.com/getData"
//                   parameters:nil
//                      success:^(id responseObject) {
//                          NSLog(@"GET success: %@", responseObject);
//                      } failure:^(NSError *error) {
//                          NSLog(@"GET error: %@", error);
//                      }];



//NSDictionary *params = @{@"key": @"value"};
//[NetworkTool postRequestWithURL:@"https://api.example.com/postData"
//                    parameters:params
//                       success:^(id responseObject) {
//                           NSLog(@"POST success: %@", responseObject);
//                       } failure:^(NSError *error) {
//                           NSLog(@"POST error: %@", error);
//                       }];


//NSData *fileData = [NSData dataWithContentsOfFile:@"file_path"];
//[NetworkTool uploadFileWithURL:@"https://api.example.com/upload"
//                    parameters:nil
//                      fileData:fileData
//                       fileName:@"example.jpg"
//                       mimeType:@"image/jpeg"
//                        success:^(id responseObject) {
//                            NSLog(@"Upload success: %@", responseObject);
//                        } failure:^(NSError *error) {
//                            NSLog(@"Upload error: %@", error);
//                        }];


//[NetworkTool downloadFileWithURL:@"https://api.example.com/download"
//                       saveToPath:@"/path/to/save/file"
//                          progress:^(NSProgress *downloadProgress) {
//                              NSLog(@"Download progress: %f", downloadProgress.fractionCompleted);
//                          } success:^(NSURL *filePath) {
//                              NSLog(@"Download success: %@", filePath);
//                          } failure:^(NSError *error) {
//                              NSLog(@"Download error: %@", error);
//                          }];
