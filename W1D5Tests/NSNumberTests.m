//
//  NSNumberTests.m
//  W1D5
//
//  Created by steve on 2017-01-10.
//  Copyright © 2017 steve. All rights reserved.
//

#import <XCTest/XCTest.h>
@import UIKit;

@interface NSNumberTests : XCTestCase

@end

@implementation NSNumberTests

#pragma mark - NSNumber 

// prefer literal instantiation
- (void)test {
  NSNumber *num1 = [[NSNumber alloc] initWithInt:22];
  NSNumber *num2 = [NSNumber numberWithFloat:12.2];
  NSNumber *num3 = @(33);
  NSNumber *num4 = @(YES); // BOOL
  NSNumber *num5 = @('i'); // Char
  NSArray *array = @[num1, num2, num3, num4, num5];
  XCTAssertTrue([array[0] integerValue] == 22);
  XCTAssertTrue([array[1] compare:[NSNumber numberWithFloat:22.2]] == NSOrderedAscending);
  XCTAssertTrue([array[2] isEqual:[NSNumber numberWithInteger:33]]);
  XCTAssertTrue([num4 integerValue] == 1); // BOOLS are 1 or 0 in Objc, but never do this
  XCTAssertTrue([array[4] charValue] == 'i');
}

- (void)testSomeTricks {
  // using NSNumber's literal syntax as a dictionary key!
  NSDictionary *dict = @{@1:@"One", @2:@"Two", @3:@"Three"};
  
  // looping: dict.allKeys gets an array of keys, but notice it has no definite order
  // dictionaries are unordered
  
  for (NSNumber *key in dict.allKeys) {
    NSLog(@"%@", dict[key]);
  }
  
  NSInteger num5 = 44;
  // logging primitive integer types by wrapping them in an NSNumber literal syntax
  NSLog(@"logging an NSInteger by wrapping it: %@", @(num5));
  
  // this is a quick way to get the string value of an integer type
  NSString *num5ToString = @(num5).stringValue;
  
  // this is the long way of doing the same thing
  num5ToString = [NSString stringWithFormat:@"%d", 44];
}

- (void)testEquality {
  NSNumber *num7 = @(22);
  NSNumber *num8 = [NSNumber numberWithInteger:22];
  XCTAssertFalse(num7 == num8); // this is a pointer comparison, likely not what you want!
  
  // comparing unwrapped values
  XCTAssertTrue([num7 intValue] == [num8 intValue]);
  
  XCTAssertTrue([num7 isEqualToNumber:num8]);
}

- (void)testComparison {
  NSNumber *num7 = @(22);
  NSNumber *num8 = [NSNumber numberWithInteger:23];
  NSComparisonResult comparisonResult = [num7 compare:num8];
  
  NSString *expected = @"ascending";
  NSString *result;
  
  if (comparisonResult == NSOrderedAscending) {
    result = @"ascending";
  } else if (comparisonResult == NSOrderedSame) {
    result = @"same";
  } else if (comparisonResult == NSOrderedDescending) {
    result = @"descending";
  }
  XCTAssertTrue([expected isEqualToString:result]);
}

#pragma mark - NSValue

// Box CGRect with NSValue
- (void)testNSValueWithRect {
  CGRect rect1 = CGRectMake(0.0, 0.0, 200.0, 200.0);
  CGRect rect2 = CGRectMake(100.0, 0.0, 200.0, 200.0);
  
  NSValue *rect1Box = [NSValue valueWithCGRect:rect1];
  NSValue *rect2Box = [NSValue valueWithCGRect:rect2];
  
  NSArray *rectArr = @[rect1Box, rect2Box];
  
  CGRect rect1Unboxed = [rectArr[0] CGRectValue];
  NSLog(@"rect1 unboxed: %@", NSStringFromCGRect(rect1Unboxed));
  CGRect rect2Unboxed = [rectArr[1] CGRectValue];
  NSLog(@"rect2 unboxed: %@", NSStringFromCGRect(rect2Unboxed));
  
  XCTAssertFalse(CGRectEqualToRect(rect1Unboxed, rect2Unboxed));
}




@end
