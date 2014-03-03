//
// Created by Dani Postigo on 1/30/14.
// Copyright (c) 2014 Dani Postigo. All rights reserved.
//

#import <DPWindow/DPHeaderedWindow.h>
#import <BOUI/BOUILogPadController.h>
#import "LogPadWindowController.h"
#import "NSWindowController+DPWindow.h"

@implementation LogPadWindowController

- (void) windowDidLoad {
    [super windowDidLoad];


    BOUILogPadController *controller = [[BOUILogPadController alloc] init];
    self.headeredWindow.contentContentView = controller.view;

}

@end