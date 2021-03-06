//
// Created by Dani Postigo on 1/30/14.
// Copyright (c) 2014 Dani Postigo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ProjectWindowController.h"

@class TimeLog;
@class DPTimerTextField;

@interface StopwatchWindowController : ProjectWindowController <NSDrawerDelegate> {

    IBOutlet NSObjectController *objectController;
    IBOutlet NSTextField *startField;
    IBOutlet NSTextField *stopField;
    IBOutlet DPTimerTextField *counterField;
    TimeLog *currentLog;

    IBOutlet NSDrawer *drawer;
    IBOutlet NSView *logsView;

    IBOutlet NSButton *titleBarButton;
}

@property(nonatomic, strong) TimeLog *currentLog;

- (IBAction) start: (id) sender;
- (IBAction) stop: (id) sender;
@end