//
// Created by Dani Postigo on 1/30/14.
// Copyright (c) 2014 Dani Postigo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BasicDelegater.h"

@class BOAPIModel;
@class Task;

@interface Model : BasicDelegater {
    NSOperationQueue *queue;

    Task *selectedTask;
}

@property(nonatomic, strong) NSOperationQueue *queue;
@property(nonatomic, strong) Task *selectedTask;

+ (Model *) sharedModel;
- (BOAPIModel *) apiModel;
@end