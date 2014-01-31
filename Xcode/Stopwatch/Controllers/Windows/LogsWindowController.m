//
// Created by Dani Postigo on 1/30/14.
// Copyright (c) 2014 Dani Postigo. All rights reserved.
//

#import "LogsWindowController.h"
#import "LogsController.h"

@implementation LogsWindowController

- (void) windowDidLoad {
    [super windowDidLoad];

    LogsController *controller = [[LogsController alloc] init];
    self.window.contentView = controller.view;
}

@end