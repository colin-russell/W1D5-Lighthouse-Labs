//
//  GreeterDelegationExampleTests.m
//  W1D5
//
//  Created by steve on 2017-03-09.
//  Copyright © 2017 steve. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "UnfriendlyGreetingDecider.h"
#import "FriendlyGreetingDecider.h"

@interface GreeterDelegationExampleTests : XCTestCase
@property (nonatomic, strong) Greeter *greeter;
@end

@implementation GreeterDelegationExampleTests

- (void)setUp {
  [super setUp];
  self.greeter = [[Greeter alloc] init];
}

- (void)tearDown {
  [super tearDown];
  self.greeter = nil;
}

- (void)testUnfriendlyGreeter {
  self.greeter.delegate = [[FriendlyGreetingDecider alloc] init];
  NSString *result = [self.greeter greet];
  XCTAssertTrue([result isEqualToString:@"Hello"]);
}

- (void)testFriendlyGreeter {
  self.greeter.delegate = [[UnfriendlyGreetingDecider alloc] init];
  NSString *result = [self.greeter greet];
  XCTAssertTrue([result isEqualToString:@"I can't say anything, sorry"]);
}

@end
