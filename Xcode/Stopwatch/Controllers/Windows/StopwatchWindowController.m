//
// Created by Dani Postigo on 1/30/14.
// Copyright (c) 2014 Dani Postigo. All rights reserved.
//

#import <BOAPI/Task.h>
#import "StopwatchWindowController.h"
#import "TimeLog.h"
#import "DPTimeControlTextField.h"
#import "NSWindow+DPKit.h"
#import "NSShadow+DPKit.h"
#import "DPHeaderedWindow.h"
#import "DPShadowView.h"
#import "LogsController.h"
#import "LogsWindowController.h"
#import "NSWindowController+DPWindow.h"
#import "LogsDetailController.h"
#import "NSView+NewConstraint.h"
#import "Log.h"
#import "Model.h"
#import "NSView+TMUtils.h"
#import "NSView+SuperConstraints.h"
#import "NSButton+DPViewButtonCell.h"

@implementation StopwatchWindowController

- (void) windowDidLoad {
    [super windowDidLoad];

    [self setupBackground];
    [self setupLogDetailsView];

    [self setupTitleView];

    counterField.stopBlock = ^(DPTimerTextField *textField) {
        NSLog(@"%s", __PRETTY_FUNCTION__);
        Log *log = [[Log alloc] initWithTitle: @""];
        log.startDate = textField.startDate;
        log.endDate = textField.stopDate;
        NSLog(@"[Model sharedModel].selectedTask = %@", [Model sharedModel].selectedTask);
        [[Model sharedModel].selectedTask.logs addObject: log];
    };

}

- (void) setupTitleView {

    NSView *view = [[NSView alloc] initWithFrame: titleBarButton.bounds];
    view.translatesAutoresizingMaskIntoConstraints = NO;
    [view styleAsLogsView];
    [titleBarButton addSubview: view];
    [view superConstrainEdges: 0];

//    if (titleBarButton.viewButtonCell) {
    //        [titleBarButton viewDidChangeBackingProperties];
    //    }

}

- (void) setupLogDetailsView {
    LogsDetailController *controller = [[LogsDetailController alloc] init];
    controller.view.frame = logsView.bounds;
    [logsView addSubview: controller.view];
    [controller.view superConstrainCenterX];
    [controller.view superConstrainCenterY];
    [controller.view superConstrainWidth];
    [controller.view superConstrainHeight];
}

- (void) setupBackground {

    NSView *contentView = self.headeredWindow.contentContentView;
    contentView.wantsLayer = YES;

    CALayer *layer = contentView.layer;
    layer.borderColor = [NSColor darkGrayColor].CGColor;
    layer.borderWidth = 1.0;

}

- (IBAction) showLogs: (id) sender {
    LogsWindowController *controller = [[LogsWindowController alloc] init];
    NSWindow *window = controller.window;

    NSRect frame = window.frame;
    frame.origin.x = NSMaxX(self.window.frame) + 20;
    frame.origin.y = NSMinY(self.window.frame);

    [window setFrame: frame display: YES];
    [self.window addChildWindow: controller.window ordered: NSWindowAbove];
}

- (IBAction) showDrawer: (id) sender {

}

- (IBAction) toggle: (id) sender {
    if (counterField.isRunning) {
        [self stop: nil];
    } else {
        [self start: nil];
    }

}


- (IBAction) start: (id) sender {

    if (currentLog == nil) {
        self.currentLog = [[TimeLog alloc] initWithTitle: @"Title"];
        currentLog.startDate = [NSDate date];
    }

    counterField.startDate = currentLog.startDate;

}


- (IBAction) stop: (id) sender {

    currentLog.endDate = [NSDate date];
    [counterField stop];

}


@end