//
// Created by Dani Postigo on 1/29/14.
// Copyright (c) 2014 Dani Postigo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DPObject : NSObject {
    NSString *identifier;
    NSString *title;
}

@property(nonatomic, copy) NSString *identifier;
@property(nonatomic, copy) NSString *title;
- (instancetype) initWithTitle: (NSString *) aTitle;
+ (instancetype) objectWithTitle: (NSString *) aTitle;

@end