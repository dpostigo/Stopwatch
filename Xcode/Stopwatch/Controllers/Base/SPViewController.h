//
// Created by Dani Postigo on 1/30/14.
// Copyright (c) 2014 Dani Postigo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ModelDelegate.h"

@class Model;

@interface SPViewController : NSViewController <ModelDelegate> {
    Model *_model;
}

- (void) setup;
- (NSOperationQueue *) queue;
@end