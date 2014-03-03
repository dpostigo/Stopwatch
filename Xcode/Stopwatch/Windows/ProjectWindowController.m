//
// Created by Dani Postigo on 1/30/14.
// Copyright (c) 2014 Dani Postigo. All rights reserved.
//

#import <NSColor-BlendingUtils/NSColor+BlendingUtils.h>
#import <DPWindow/DPHeaderedWindow.h>
#import "ProjectWindowController.h"
#import "NSColor+Crayola.h"
#import "NSWindowController+DPWindow.h"

@implementation ProjectWindowController

- (void) loadWindow {
    [super loadWindow];
    [self stylize];
}

- (void) windowDidLoad {
    [super windowDidLoad];
}


- (void) stylize {
    if (self.headeredWindow) {
        self.headeredWindow.titleBarColor = [NSColor crayolaOnyxColor];
        self.headeredWindow.shineColor = [[NSColor whiteColor] mix: [NSColor crayolaOnyxColor] fraction: 0.8];
    }
}

- (void) stylizeFooter {


}

@end