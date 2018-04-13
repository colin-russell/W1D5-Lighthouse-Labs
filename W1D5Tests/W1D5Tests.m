  //
  //  W1D5Tests.m
  //  W1D5Tests
  //
  //  Created by steve on 2017-01-10.
  //  Copyright © 2017 steve. All rights reserved.
  //

#import <XCTest/XCTest.h>

  // Protocol
@protocol MyProtocol <NSObject>
@optional
- (void)myOptionalMethod;
@end

  // MyObject Class
@interface MyObject : NSObject <MyProtocol>
@end
@implementation MyObject
- (void)myOptionalMethod {
  NSLog(@"%s was called", __PRETTY_FUNCTION__);
}
@end

@interface W1D5Tests : XCTestCase
@property (nonatomic) BOOL wasCalled;
@end

@implementation W1D5Tests

- (void)setUp {
  [super setUp];
}

- (void)tearDown {
  [super tearDown];
  self.wasCalled = NO;
}

  // Example 1
- (void)fly {}
- (void)nameOfMethod { }

- (void)testTwoWaysToCreateSelector {
  
    //1. compile time
  SEL aSelector1 = @selector(fly);
  
    //2. run time
  NSString *name = @"name";
  NSString *of = @"Of";
  NSString *method = @"Method";
  NSString *stringFromComponents = [NSString stringWithFormat:@"%@%@%@", name, of, method];
  SEL aSelector2 = NSSelectorFromString(stringFromComponents);
  BOOL result1 = [W1D5Tests instancesRespondToSelector: aSelector1];
  BOOL result2 = [W1D5Tests instancesRespondToSelector: aSelector2];
  XCTAssertTrue(result1);
  XCTAssertTrue(result2);
}

  // Example 2

- (void)testSelectorWithOneParam {
    // notice the colon
  SEL mySelector = @selector(myMethodWithData:);
  [self performSelectorOnMainThread: mySelector withObject:[NSData new] waitUntilDone: YES];
  XCTAssertTrue(self.wasCalled);
}

  // Example 3

- (void)testSelectorWithTwoParams {
  [self performSelector:@selector(fullNameWithFirstName: lastName:) withObject:@"Joe" withObject:@"Blow"];
  XCTAssertTrue(self.wasCalled);
}

- (void)myMethodWithData:(NSData *)data {
  self.wasCalled = YES;
}

- (void)fullNameWithFirstName:(NSString *)first
                     lastName:(NSString *)last {
  self.wasCalled = YES;
}


  // Example 4

/*
 // definition of a method that adds a target/action to a button
 - (void)addTarget:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents;
 */

- (void)testButtonSelectorArgument {
    // adding it to a button
  UIButton *button = [[UIButton alloc] initWithFrame:CGRectZero];
  [button addTarget: self action:@selector(buttonTapped:) forControlEvents:UIControlEventTouchUpInside];
  [self performSelectorOnMainThread:@selector(buttonTapped:) withObject: button waitUntilDone: YES];
  XCTAssertTrue(self.wasCalled);
  
}

  // Method called when the button is tapped
- (void)buttonTapped:(UIButton *)sender {
  self.wasCalled = YES;
}

  // Example 5

- (void)testSendMessageToOptionalProtocolMethod {
  
  MyObject *myObject = [MyObject new];
  
    SEL mySelector = @selector(myOptionalMethod);
  
  BOOL respondsToSelector = [myObject respondsToSelector:mySelector];
  XCTAssertTrue(respondsToSelector);
  
    // you can conditionally send it the message (calling an optional method that wasn't implemented causes a crash)
  if (respondsToSelector) {
    [myObject myOptionalMethod];
  }
}


- (void)testArraySortUsingSelector {
  NSArray *unsorted = @[@"Hello", @"Light", @"House", @"Labs"];
  NSArray *sorted = [unsorted sortedArrayUsingSelector:@selector(compare:)];
  NSArray *expected = @[@"Hello", @"House", @"Labs", @"Light"];
  XCTAssert([sorted isEqualToArray: expected]);
}

@end
