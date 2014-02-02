//
// Created by Dani Postigo on 1/31/14.
// Copyright (c) 2014 Dani Postigo. All rights reserved.
//

#import <DPWindow/NSWindowController+DPWindow.h>
#import <DPWindow/DPHeaderedWindow.h>
#import "EmptyWindowController.h"
#import "LogsDetailController.h"

@implementation EmptyWindowController

- (void) windowDidLoad {
    [super windowDidLoad];

    self.headeredWindow.contentContentView = [[LogsDetailController alloc] init].view;

}

@end