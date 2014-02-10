//
// Created by Dani Postigo on 1/30/14.
// Copyright (c) 2014 Dani Postigo. All rights reserved.
//

#import <BOAPI/BOAPIModel.h>
#import <BOAPI/GetLogsOperation.h>
#import <DPObject/DPObjectObserver.h>
#import <DPObject/NSObject+DPObjectObserver.h>
#import "Model.h"
#import "Task.h"

@implementation Model

@synthesize queue;
@synthesize selectedTask;

@synthesize autoLogin;

@synthesize observer;

+ (Model *) sharedModel {
    static Model *_instance = nil;

    @synchronized (self) {
        if (_instance == nil) {
            _instance = [[self alloc] init];
        }
    }
    return _instance;
}


- (id) init {
    self = [super init];
    if (self) {
        observer = [DPObjectObserver observer];
        [self observeObject: self key: @"selectedTask"];
    }

    return self;
}

#pragma mark Getters

- (NSOperationQueue *) queue {
    if (queue == nil) {
        queue = [NSOperationQueue new];
    }
    return queue;
}


- (BOAPIModel *) apiModel {
    return [BOAPIModel sharedModel];
}


//- (Task *) selectedTask {
//    if (selectedTask == nil && [self.apiModel.tasks count] > 0) {
//        self.selectedTask = [self.apiModel.tasks objectAtIndex: 0];
//    }
//    return selectedTask;
//}


//- (void) setSelectedTask: (Task *) selectedTask1 {
//    //    if (selectedTask) {
//    //        [selectedTask unsubscribeDelegate: self];
//    //    }
//    selectedTask = selectedTask1;
//
//    if (selectedTask) {
//        [selectedTask subscribeDelegate: self];
//                [self notifyDelegates: @selector(modelDidSelectTask:) object: selectedTask];
//        //        //        NSLog(@"%s, starting GetLogsOperation.", __PRETTY_FUNCTION__);
//        //        [self.queue addOperation: [[GetLogsOperation alloc] initWithTask: selectedTask]];
//    }
//}
//


#pragma mark Task notifications
- (void) logsDidAdd: (Log *) log {
    //    NSLog(@"%s", __PRETTY_FUNCTION__);
}

- (void) logsDidRemove: (Log *) log {
    //    NSLog(@"%s", __PRETTY_FUNCTION__);
    [self.apiModel notifyDelegates: @selector(timeLogsDidRemove:) object: log];
}

- (void) logsDidReplace: (Log *) oldLog with: (Log *) log {
    //    NSLog(@"%s", __PRETTY_FUNCTION__);
}


#pragma mark Model notifications

- (void) modelWillUpdateSelectedTask {
    //    [self.selectedTask unsubscribeDelegate: self];

}


- (void) modelDidUpdate: (Model *) model withSelectedTask: (Task *) task {
    //    [self.selectedTask subscribeDelegate: self];
    [observer observeObject: self.selectedTask key: @"logs"];
    [self.queue addOperation: [[GetLogsOperation alloc] initWithTask: self.selectedTask]];
}


@end