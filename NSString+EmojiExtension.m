//
//  NSString+EmojiExtension.m
//  NSString+EmojiExtension
//
//  Created by nktn on 2015/02/15.
//  Copyright (c) 2015年 nktn All rights reserved.
//

#import "NSString+EmojiExtension.h"
#include <unicode/utf8.h>
@implementation NSString(EmojiExtension)


-(BOOL)isEmoji{
    NSData *d = [self dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:NO];
    if(!d) return nil;
    const char *buf = d.bytes;
    NSInteger len = [d length];
    char *s = (char *)malloc(len);
    unsigned int input_i = 0, output_i = 0;
    UChar32 uc;
    while (input_i < len) {
        U8_NEXT_UNSAFE(buf, input_i, uc);
        if(0x2100 <= uc && uc <= 0x26ff) continue;
        if(0x1d000 <= uc && uc <= 0x1f77f) continue;
        U8_APPEND_UNSAFE(s, output_i, uc);
    }
    if (input_i == output_i){
        return false;
    }
    return true;
}

- (NSString *)stringByRemovingEmoji {
    NSData *d = [self dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:NO];
    if(!d) return nil;
    const char *buf = d.bytes;
    NSInteger len = [d length];
    char *s = (char *)malloc(len);
    unsigned int input_i = 0, output_i = 0;
    UChar32 uc;
    while (input_i < len) {
        U8_NEXT_UNSAFE(buf, input_i, uc);
        if(0x2100 <= uc && uc <= 0x26ff) continue;
        if(0x1d000 <= uc && uc <= 0x1f77f) continue;
        U8_APPEND_UNSAFE(s, output_i, uc);
    }
    return [[NSString alloc] initWithBytesNoCopy:s length:output_i encoding:NSUTF8StringEncoding freeWhenDone:YES];
}

@end
