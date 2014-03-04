//
// Created by Dani Postigo on 3/3/14.
// Copyright (c) 2014 Dani Postigo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ProjectWindowController.h"

@interface MainWindowController : ProjectWindowController {
    IBOutlet NSSegmentedControl *segmentedControl;
    IBOutlet NSTabView *tabView;
}
@end