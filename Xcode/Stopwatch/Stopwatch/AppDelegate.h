//
//  AppDelegate.h
//  Stopwatch
//
//  Created by Dani Postigo on 1/28/14.
//  Copyright (c) 2014 Dani Postigo. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <BOAPI/BOAPIDelegate.h>

@interface AppDelegate : NSObject <NSApplicationDelegate, BOAPIDelegate> {
    NSWindowController *windowController;

}

@property(assign) IBOutlet NSWindow *window;

@property(nonatomic, strong) NSWindowController *windowController;
@end
