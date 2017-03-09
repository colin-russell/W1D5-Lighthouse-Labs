//
//  Greeter.h
//  Greeter
//
//  Created by steve on 2017-01-13.
//  Copyright © 2017 steve. All rights reserved.
//

#import <Foundation/Foundation.h>

// this protocol could be in a separate .h file instead

@protocol GreeterDelegate <NSObject>
- (BOOL)shouldGreet;
@end

@interface Greeter : NSObject
@property (nonatomic)id<GreeterDelegate>delegate;
- (NSString *)greet;
@end
