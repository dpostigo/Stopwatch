//
// Created by Dani Postigo on 1/30/14.
// Copyright (c) 2014 Dani Postigo. All rights reserved.
//

#import <BOAPI/BOAPIModel.h>
#import <BOAPI/GetLogsOperation.h>
#import "Model.h"
#import "Task.h"

@implementation Model

@synthesize queue;
@synthesize selectedTask;

+ (Model *) sharedModel {
    static Model *_instance = nil;

    @synchronized (self) {
        if (_instance == nil) {
            _instance = [[self alloc] init];
        }
    }
    return _instance;
}

- (NSOperationQueue *) queue {
    if (queue == nil) {
        queue = [NSOperationQueue new];
    }
    return queue;
}


- (BOAPIModel *) apiModel {
    return [BOAPIModel sharedModel];
}


- (void) setSelectedTask: (Task *) selectedTask1 {
    selectedTask = selectedTask1;
    if (selectedTask) {
        [self notifyDelegates: @selector(modelDidSelectTask:) object: selectedTask];
        [self.queue addOperation: [[GetLogsOperation alloc] initWithTask: selectedTask]];
    }
}

@end