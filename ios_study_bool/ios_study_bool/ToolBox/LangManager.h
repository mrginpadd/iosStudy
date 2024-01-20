//
//  LangManager.h
//  ios_study_bool
//
//  Created by xushihao on 2024/1/20.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
typedef NS_ENUM(NSInteger, LANGTYPE) {
    DEFINE,
    STR,
    ARRAY,
    DICTIONARY
};
@interface LangManager : NSObject

+ (void) perform:(LANGTYPE) type;
+ (void) performDefine;
+ (void) performStr;
+ (void) performArray;
+ (void) performDic;
@end

NS_ASSUME_NONNULL_END
