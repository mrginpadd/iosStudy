//
//  FakeUtil.m
//  ios_study_bool
//
//  Created by xushihao on 2024/1/27.
//

#import "FakeUtil.h"
#import <Foundation/Foundation.h>
@implementation FakeUtil

+(NSString *)generateChineseSentence:(int) length {
    NSMutableString *sentence = [NSMutableString stringWithCapacity:length];
    
    // 中文字符范围（Unicode编码）
    int start = 0x4e00;
    int end = 0x9fa5;
    
    for (int i = 0; i < length; i++) {
        int randCode = (int)(start + arc4random_uniform(end - start));
        [sentence appendString:[[NSString alloc] initWithBytes:&randCode length:2 encoding:NSUTF16LittleEndianStringEncoding]];
    }
    return sentence;
}

+(NSArray *)generateChineseSentences:(int) numSentences {
    NSMutableArray *sentences = [NSMutableArray arrayWithCapacity:numSentences];
    for (int i = 0; i < numSentences; i++) {
        int randLength = arc4random_uniform(16) + 5; // 句子长度为 5 到 20 个字符
        NSString *sentence = [self generateChineseSentence:randLength];
        [sentences addObject:sentence];
    }
    return sentences;
}


@end
