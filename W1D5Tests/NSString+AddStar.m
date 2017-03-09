//
//  NSString+AddStar.m
//  W1D5
//
//  Created by steve on 2017-03-09.
//  Copyright © 2017 steve. All rights reserved.
//

#import "NSString+AddStar.h"

@implementation NSString (AddStar)
- (NSString *)addStar {
  return [self stringByAppendingString:@"*"];
}
@end
