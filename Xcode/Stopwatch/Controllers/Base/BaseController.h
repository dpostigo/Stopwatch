//
// Created by Dani Postigo on 1/30/14.
// Copyright (c) 2014 Dani Postigo. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Model;

@interface BaseController : NSViewController {
    Model *_model;
}

- (NSOperationQueue *) queue;
@end