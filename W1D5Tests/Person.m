//
//  Person.m
//  W1D5
//
//  Created by steve on 2017-03-09.
//  Copyright © 2017 steve. All rights reserved.
//

#import "Person.h"

@interface Person()

// privately age is readwrite but publicly it's readonly
@property (nonatomic, readwrite) NSInteger age; // optional way of doing this, because you
@property (nonatomic) NSString *name;
@end

@implementation Person

// this is called the designated initializer
- (instancetype)initWithName:(NSString *)name age:(NSInteger)age {
  if (self = [super init]) {
    _name = name;
    _age = age;
  }
  return self;
}

@end
