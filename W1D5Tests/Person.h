//
//  Person.h
//  W1D5
//
//  Created by steve on 2017-03-09.
//  Copyright © 2017 steve. All rights reserved.
//

@import Foundation; // Notice the modern importation syntax

@interface Person: NSObject

// Notice age is readonly
@property (nonatomic, readonly) NSInteger age;

- (instancetype)initWithName:(NSString *)name age:(NSInteger)age;

@end
