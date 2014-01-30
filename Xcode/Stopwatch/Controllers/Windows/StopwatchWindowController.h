//
// Created by Dani Postigo on 1/30/14.
// Copyright (c) 2014 Dani Postigo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseWindowController.h"

@class TimeLog;
@class DPTimeControlTextField;

@interface StopwatchWindowController : BaseWindowController <NSDrawerDelegate> {

    IBOutlet NSObjectController *objectController;
    IBOutlet NSTextField *startField;
    IBOutlet NSTextField *stopField;
    IBOutlet DPTimeControlTextField *counterField;
    TimeLog *currentLog;

    IBOutlet NSDrawer *drawer;

}

@property(nonatomic, strong) TimeLog *currentLog;

- (IBAction) start: (id) sender;
- (IBAction) stop: (id) sender;
@end