//
//  ClassExtension.m
//  W1D5
//
//  Created by steve on 2017-01-10.
//  Copyright © 2017 steve. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Person.h"

@interface ClassExtension : XCTestCase // this interface is not visible outside of this object since it's not in the header file
// stuff here not visible outside
@end

@implementation ClassExtension

- (void)test {
  
  Person *person2 = [[Person alloc] initWithName:@"JJ" age:10];
  // name is inside the class extension so is not visible from outside!
  //  XCTAssert(person2.name = @"JJ");
  XCTAssert(person2.age == 10);
}


@end
