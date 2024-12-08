//
//  CusNetworkUserModel.h
//  ios_study_bool
//
//  Created by xushihao on 2024/12/8.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CusNetworkUserModel : NSObject

@property(nonatomic, assign) NSInteger userId;
@property(nonatomic, strong) NSString *name;
@property(nonatomic, strong) NSString *username;
@property(nonatomic, strong) NSString *email;

#pragma -mark Json转换
// 用于从字典初始化User对象
- (instancetype)initWithDictionary:(NSDictionary *)dic;
// 将User对象转换为字典
- (NSDictionary *)toDictionary;
// 将User对象转换为Json数据
- (NSData *)toJson;

#pragma -mark 网络请求
+ (void)fetchUserData;

+ (void)addUserData:(CusNetworkUserModel *)user;

@end



NS_ASSUME_NONNULL_END
