//
//  UnfriendlyGreetingDecider.m
//  Greeter
//
//  Created by steve on 2017-03-09.
//  Copyright © 2017 steve. All rights reserved.
//

#import "UnfriendlyGreetingDecider.h"

@implementation UnfriendlyGreetingDecider
- (BOOL)shouldGreet {
  return NO;
}

// this method isn't "exposed" in the .h file.
- (void)anotherMethod {
  
}
@end
