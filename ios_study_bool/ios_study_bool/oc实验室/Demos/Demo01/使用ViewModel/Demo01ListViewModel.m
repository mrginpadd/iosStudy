//
//  Demo01ListViewModel.m
//  ios_study_bool
//
//  Created by xushihao on 2025/5/10.
//

#import "Demo01ListViewModel.h"

@interface Demo01ListViewModel()
@property(nonatomic, strong) NSMutableArray<Demo01Item*> *mutableItems;
@end

@implementation Demo01ListViewModel

-(instancetype)init {
    self = [super init];
    if (self) {
        _mutableItems = @[].mutableCopy;
    }
    return self;
}

- (NSArray<Demo01Item *>*)items {
    return [_mutableItems copy];
}

-(void)loadData {
    for(int i=0; i<40; i++) {
        [_mutableItems addObject:[[Demo01Item alloc] initWithName:[NSString stringWithFormat:@"Item %d", i]]];
    }
}

@end
