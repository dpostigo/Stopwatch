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

@implementation StopwatchWindowController

- (void) windowDidLoad {
    [super windowDidLoad];
//    [self.window setHasShadow: NO];

    NSLog(@"self.window.windowThemeFrame.superview = %@", self.window.windowThemeFrame.superview);
    NSLog(@"self.window.windowThemeFrame.subviews = %@", self.window.windowThemeFrame.subviews);

    NSView *contentView = self.headeredWindow.contentContentView;
    contentView.wantsLayer = YES;

    CALayer *layer = contentView.layer;
    layer.borderColor = [NSColor darkGrayColor].CGColor;
    layer.borderWidth = 1.0;

    //
    //    NSView *theme = self.window.windowThemeFrame;
    //    theme.wantsLayer = YES;
    //    NSLog(@"theme.isOpaque = %d", theme.isOpaque);
    //
    //    CALayer *layer = theme.layer;
    //    layer.masksToBounds = NO;
    //    layer.shadowColor = [NSColor blackColor].CGColor;
    //    layer.shadowOpacity = 1.0;
    //    layer.shadowOffset = NSMakeSize(0, -1);
    //    layer.shadowRadius = 2.0;
    //    [layer setOpaque: NO];
    //
    //    NSView *contentView = self.headeredWindow.contentContentView;
    //    contentView.wantsLayer = YES;
    //
    //    layer = contentView.layer;
    //    layer.borderColor = [NSColor blueColor].CGColor;
    //    layer.borderWidth = 1.0;
    //    layer.masksToBounds = NO;
    //
    //    NSLog(@"theme = %@", theme);
    //
    //    contentView.shadow = [NSShadow shadowWithColor: [NSColor blackColor] radius: 1.0 offset: NSMakeSize(0, -1)];
    //
    //    NSLog(@"theme.wantsDefaultClipping = %d", theme.wantsDefaultClipping);
    //
    //    DPShadowView *shadow = [[DPShadowView alloc] init];
    //    shadow.width = 100;
    //    shadow.height = 100;
    //    [self.headeredWindow.contentContentView addSubview: shadow];
    //    NSLog(@"shadow.wantsDefaultClipping = %d", shadow.wantsDefaultClipping);
    //    //    theme.shadow
}


- (DPHeaderedWindow *) headeredWindow {
    return (DPHeaderedWindow *) ([self.window isKindOfClass: [DPHeaderedWindow class]] ? self.window : nil);
}

- (IBAction) showDrawer: (id) sender {

    [drawer openOnEdge: NSMaxXEdge];
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