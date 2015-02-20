//
//  NSString+EmojiExtension.h
//  NSString+EmojiExtension
//
//  Created by nktn on 2015/02/15.
//  Copyright (c) 2015年 nktn All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString(EmojiExtension)
- (BOOL)isEmoji;
- (NSString *)stringByRemovingEmoji;
@end
