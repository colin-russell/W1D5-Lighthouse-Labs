  //
  //  ProtocolTests.m
  //  W1D5
  //
  //  Created by steve on 2017-03-09.
  //  Copyright © 2017 steve. All rights reserved.
  //

#import <XCTest/XCTest.h>

#pragma mark - Protocol

  // NOTE: protocols can be defined in a separate file and imported instead. When would you do this?

  //#import "AnotherProtocol.h"


  // Protocols can inherit from other protocols

@protocol MyProtocol<NSObject>
- (void)putYourMethodsHere;
@end

  // Optional/required
  // Protocols support multiple inheritance
@protocol AnotherProtocol<MyProtocol>

  // @required is default and this method is inherited from <MyProtocol> so no need to redeclare its method
  // - (void)putYourMethodsHere;

@optional
- (void)optionalMethod;
  // use @required to switch back

@required
- (NSString*)requiredAgain;

@end


#pragma mark - Class
  // Conforming To A Protocol

@interface MyClass:NSObject<AnotherProtocol>
  // don't put the signatures in the header
@end

@implementation MyClass

  // required
- (NSString*)requiredAgain {
  return @"Some result";
}

  // required
- (void)putYourMethodsHere {
    // do stuff
}
@end


#pragma mark - Tests

@interface ProtocolTests : XCTestCase
@end
@implementation ProtocolTests

- (void)testProtocolConformance {
  BOOL conforms = [MyClass conformsToProtocol:@protocol(AnotherProtocol)];
  XCTAssertTrue(conforms);
}

- (void)testInstanceThatDoesNotConformToOptionalProtocol {
  MyClass *myClass = [MyClass new];
  BOOL conforms = [myClass respondsToSelector:@selector(optionalMethod)];
  XCTAssertFalse(conforms);
}

- (void)test {
  MyClass *myClass = [MyClass new];
  NSString *result = [myClass requiredAgain];
  XCTAssertTrue([result isEqualToString:@"Some result"]);
}


@end
