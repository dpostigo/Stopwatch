//
// Created by Dani Postigo on 2/12/14.
// Copyright (c) 2014 Dani Postigo. All rights reserved.
//

#import "CounterWindowController.h"
#import "NSWindow+DPKit.h"
#import "NSView+DPKit.h"
#import "LogDetailCardCellView.h"
#import "NSView+NewConstraint.h"

@implementation CounterWindowController

- (void) windowDidLoad {
    [super windowDidLoad];

    NSView *cardView = [self.window.contentAsView viewWithIdentifier: @"CardView"];

    //    LogDetailCardCellView *cell = [[LogDetailCardCellView alloc] init];
    //    cardView.bounds = cell.bounds;
    //    [self.window.contentAsView addSubview: cell];
    //    [cell superConstrainEdges];
}


@end