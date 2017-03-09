//
//  AnotherProtocol.h
//  W1D5
//
//  Created by steve on 2017-03-09.
//  Copyright © 2017 steve. All rights reserved.
//

@import Foundation;

// Protocols can inherit from other protocols
@protocol MyProtocol<NSObject>
- (void)putYourMethodsHere;
@end

// Optional/required

@protocol AnotherProtocol<MyProtocol>
// @required is default and this method is inherited from <MyProtocol>
// - (void)putYourMethodsHere;
// optional
@optional
- (void)optionalMethod;
// use @required to switch back
@required
- (NSString*)requiredAgain;
@end
