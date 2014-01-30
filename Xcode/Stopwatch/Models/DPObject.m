//
// Created by Dani Postigo on 1/29/14.
// Copyright (c) 2014 Dani Postigo. All rights reserved.
//

#import "DPObject.h"
#import "NSObject+AutoDescription.h"

@implementation DPObject

@synthesize identifier;
@synthesize title;

- (instancetype) initWithTitle: (NSString *) aTitle {
    self = [super init];
    if (self) {
        title = aTitle;
    }

    return self;
}

+ (instancetype) objectWithTitle: (NSString *) aTitle {
    return [[self alloc] initWithTitle: aTitle];
}


- (NSString *) description {
    return [self autoDescription];
}


@end