//
// Created by Dani Postigo on 1/30/14.
// Copyright (c) 2014 Dani Postigo. All rights reserved.
//

#import <DPWindow/DPHeaderedWindow.h>
#import <NSColor-BlendingUtils/NSColor+BlendingUtils.h>
#import <CALayer-DPUtils/CALayer+ConstraintUtils.h>
#import "LogsWindowController.h"
#import "LogsController.h"
#import "NSWindowController+DPWindow.h"
#import "NSColor+Crayola.h"

@implementation LogsWindowController

- (void) windowDidLoad {
    [super windowDidLoad];

    LogsController *controller = [[LogsController alloc] init];
    self.headeredWindow.contentContentView = controller.view;
    [controller.outline reloadData];
}

@end