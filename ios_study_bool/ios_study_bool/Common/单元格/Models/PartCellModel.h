//
//  PartCellModel.h
//  ios_study_bool
//
//  Created by xushihao on 2024/1/15.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface PartCellModel : NSObject
@property(nonatomic, strong, readwrite) NSString *title;
+(instancetype) initWithModel: (PartCellModel*) model;
@end

NS_ASSUME_NONNULL_END
