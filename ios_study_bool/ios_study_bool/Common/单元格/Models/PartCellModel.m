//
//  PartCellModel.m
//  ios_study_bool
//
//  Created by xushihao on 2024/1/15.
//

#import "PartCellModel.h"

@implementation PartCellModel
+(instancetype) initWithModel: (PartCellModel*) model {
    PartCellModel *cellModel = [[PartCellModel alloc] init];
    cellModel.title = model.title;
    return cellModel;
    
}
@end
