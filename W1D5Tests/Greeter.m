//
//  Greeter.m
//  Greeter
//
//  Created by steve on 2017-01-13.
//  Copyright © 2017 steve. All rights reserved.
//

#import "Greeter.h"

@implementation Greeter
- (NSString *)greet {
  NSString *greeting;
  if ([self.delegate shouldGreet]) {
    greeting = @"Hello";
  } else {
    greeting = @"I can't say anything, sorry";
  }
  return greeting;
}
@end








