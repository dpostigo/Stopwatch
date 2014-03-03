//
// Created by Dani Postigo on 1/31/14.
// Copyright (c) 2014 Dani Postigo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ProjectWindowController.h"

@interface TreeWindowController : ProjectWindowController <NSOutlineViewDelegate> {

    IBOutlet  NSOutlineView *outline;
    IBOutlet NSArrayController *arrayController;
}

- (IBAction) testButton;
@end