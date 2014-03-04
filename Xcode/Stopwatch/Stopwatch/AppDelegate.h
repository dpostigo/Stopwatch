//
//  AppDelegate.h
//  Stopwatch
//
//  Created by Dani Postigo on 1/28/14.
//  Copyright (c) 2014 Dani Postigo. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <BOAPI/BOAPIDelegate.h>

@class AXStatusItemPopup;
@class DPStatusItemView;

@interface AppDelegate : NSObject <NSApplicationDelegate, BOAPIDelegate> {
    NSWindowController *windowController;

    AXStatusItemPopup *statusItemPopup;
    NSViewController *popupController;
    NSMutableArray *windowNibs;
    DPStatusItemView *statusItemView;
}

@property(assign) IBOutlet NSWindow *window;
@property(nonatomic, strong) NSWindowController *windowController;
@property(nonatomic, strong) NSViewController *popupController;
@property(nonatomic, strong) NSMutableArray *windowNibs;
@end
