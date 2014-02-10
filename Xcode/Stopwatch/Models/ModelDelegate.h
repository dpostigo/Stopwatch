//
// Created by Dani Postigo on 2/9/14.
// Copyright (c) 2014 Dani Postigo. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Model;
@class Task;

@protocol ModelDelegate <NSObject>

@optional
- (void) modelWillUpdateSelectedTask;
- (void) modelDidUpdate: (Model *) model withSelectedTask: (Task *) task;
@end