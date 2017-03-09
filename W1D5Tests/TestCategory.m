//
//  TestCategory.m
//  W1D5
//
//  Created by steve on 2017-03-09.
//  Copyright © 2017 steve. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSString+AddStar.h"


@interface TestCategory : XCTestCase

@end

@implementation TestCategory

- (void)testAddStar {
  NSString *result = [@"something" addStar];
  NSString *expected = @"something*";
  XCTAssertTrue([result isEqualToString:expected]);
}


@end
