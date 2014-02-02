//
// Created by Dani Postigo on 1/30/14.
// Copyright (c) 2014 Dani Postigo. All rights reserved.
//

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
#import "NSView+SuperConstraints.h"

@implementation StopwatchWindowController

- (void) windowDidLoad {
    [super windowDidLoad];
    //    [self.window setHasShadow: NO];




    NSView *contentView = self.headeredWindow.contentContentView;
    contentView.wantsLayer = YES;

    CALayer *layer = contentView.layer;
    layer.borderColor = [NSColor darkGrayColor].CGColor;
    layer.borderWidth = 1.0;

    LogsDetailController *controller = [[LogsDetailController alloc] init];
    controller.view.frame = logsView.bounds;
    [logsView addSubview: controller.view];
    [controller.view superConstrain: <#(NSLayoutAttribute)attribute#> constant: <#(CGFloat)constant#>]

}




- (IBAction) showDrawer: (id) sender {

    NSLog(@"%s", __PRETTY_FUNCTION__);
    LogsWindowController *controller = [[LogsWindowController alloc] init];
    NSWindow *window = controller.window;

    NSRect frame = window.frame;
    frame.origin.x = NSMaxX(self.window.frame) + 20;
    frame.origin.y = NSMinY(self.window.frame);

    [window setFrame: frame display: YES];
    [window setMovable: NO];
    [self.window addChildWindow: controller.window ordered: NSWindowAbove];

    //    [drawer openOnEdge: NSMaxXEdge];
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