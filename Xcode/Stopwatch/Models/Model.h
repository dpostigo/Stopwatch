//
// Created by Dani Postigo on 1/30/14.
// Copyright (c) 2014 Dani Postigo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BasicDelegater.h"
#import "ModelDelegate.h"
#import "BOAPIDelegate.h"

@class BOAPIModel;
@class Task;
@class DPObjectObserver;

@interface Model : BasicDelegater <ModelDelegate, BOAPIDelegate> {

    DPObjectObserver *observer;
    NSOperationQueue *queue;

    Task *selectedTask;

    BOOL autoLogin;
}

@property(nonatomic, strong) NSOperationQueue *queue;
@property(nonatomic, strong) Task *selectedTask;

@property(nonatomic) BOOL autoLogin;
@property(nonatomic, strong) DPObjectObserver *observer;
+ (Model *) sharedModel;
- (BOAPIModel *) apiModel;
@end