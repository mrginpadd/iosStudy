//
//  Demo01ListViewModel.h
//  ios_study_bool
//
//  Created by xushihao on 2025/5/10.
//

#import <Foundation/Foundation.h>
#import "Demo01Item.h"
NS_ASSUME_NONNULL_BEGIN

@interface Demo01ListViewModel : NSObject
@property(nonatomic, strong) NSArray<Demo01Item*>* items;
-(void)loadData;
@end

NS_ASSUME_NONNULL_END
