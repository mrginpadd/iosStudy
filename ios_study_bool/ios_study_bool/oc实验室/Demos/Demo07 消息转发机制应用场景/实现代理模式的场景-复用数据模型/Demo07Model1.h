//
//  Demo07Model1.h
//  ios_study_bool
//
//  Created by xushihao on 2025/5/25.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
/*
 曾经在项目中做直播间道具相关业务, 第一次使用了快速消息转发。由于第二期添加了背包道具, 就是下图中的 SPTBagPropInfo 类, 相比于原来的道具, 背包道具是通过做任务等赠送的, 所以多了个数量字段, 作为我们前端来说, 理想的数据模型即和原道具数据结构一致, 只是增加一个数量字段即可, 但是后端同学给到的数据结构却是在外层加了数量这个字段, 对于我们来说, 相当于一个新对象, 这样对我们来说用起来是不方便的。

 */
@interface Demo07Model1 : NSObject
@property(nonatomic, copy) NSString *barEffect;
@property(nonatomic, copy) NSString *barIcon;
@property(nonatomic, copy) NSString *name;
@property(nonatomic, assign) NSInteger price;
@end

//所以在 .m 文件中, 直接转发给 self.detail, 即转发给原来的道具对象, 仅需自己实现原来道具没有的方法即可。
@interface Demo07Model2 : NSObject
//注意这里复用了之前的数据模型
@property(nonatomic, strong, readwrite) Demo07Model1 *detail;
@property(nonatomic, assign, readwrite) NSInteger num;
@property(nonatomic, copy) NSString *propId;
@end
NS_ASSUME_NONNULL_END
