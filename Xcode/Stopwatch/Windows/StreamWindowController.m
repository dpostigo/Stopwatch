//
// Created by Dani Postigo on 2/8/14.
// Copyright (c) 2014 Dani Postigo. All rights reserved.
//

#import <DPWindow/DPHeaderedWindow.h>
#import "StreamWindowController.h"
#import "LogDetailsController.h"
#import "NSWindowController+DPWindow.h"
#import "LogDetailCardCellView.h"

@implementation StreamWindowController

- (void) windowDidLoad {
    [super windowDidLoad];

    LogDetailsController *controller = [[LogDetailsController alloc] init];
    //    self.headeredWindow.contentContentView = controller.view;
    //    [controller.outline reloadData];

    [cardView modify];
}

@end