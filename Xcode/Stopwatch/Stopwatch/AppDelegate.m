//
//  AppDelegate.m
//  Stopwatch
//
//  Created by Dani Postigo on 1/28/14.
//  Copyright (c) 2014 Dani Postigo. All rights reserved.
//

#import <BOAPI/GetTasksOperation.h>
#import <BOAPI/Task.h>
#import <BOAPI/Log.h>
#import <BOUI/BOUILogPadController.h>
#import "AppDelegate.h"
#import "User.h"
#import "BOAPIModel.h"
#import "LoginWindowController.h"
#import "AXStatusItemPopup.h"
#import "StopwatchWindowController.h"
#import "Model.h"
#import "TreeWindowController.h"
#import "DPStatusItemView.h"
#import "LogPadWindowController.h"
#import "LogDetailsController.h"
#import "EmptyWindowController.h"
#import "AutoCoding.h"
#import "DPArrayStorageObject.h"
#import "BOAPIStorage.h"
#import "BOLogsController.h"
#import "TextViewWindowController.h"
#import "CounterWindowController.h"
#import "TableWindowController.h"
#import "NSBundle+DPKit.h"
#import "DPWindowManager.h"
#import "AXStatusItemPopup.h"
#import "NSWindow+DPKit.h"
#import "DPNavigationController.h"
#import "BOUILoginController.h"
#import "DPStatusItemView.h"
#import "Counter2WindowController.h"

@implementation AppDelegate {
    Model *_model;
    EmptyWindowController *testController;
    BOAPIModel *_apiModel;
}

@synthesize windowController;
@synthesize popupController;
@synthesize windowNibs;

- (void) applicationDidFinishLaunching: (NSNotification *) aNotification {

    _model = [Model sharedModel];
    _apiModel = [BOAPIModel sharedModel];
    //    [_model.apiModel cleanApplicationSupportFolder];
    //    [_model.apiModel cleanCache];
    [_model.apiModel subscribeDelegate: self];
    _model.apiModel.restrictLogsFetching = NO;
    //    _model.apiModel.loggingEnabled = NO;


    [self setupDeveloperItems];
    [self testStatusItem];


    //    self.windowController = [[LoginWindowController alloc] init];
}

- (void) testStatusItem {

    NSLog(@"_apiModel.isLoggedIn = %d", _apiModel.isLoggedIn);

    NSImage *image = [NSImage imageNamed: @"stopwatch2-icon"];
    LoginWindowController *loginController = [[LoginWindowController alloc] init];
    statusItemView = [[DPStatusItemView alloc] initWithWindowController: loginController image: image];


    //    statusItemView.off
    //
    //    BOUILoginController *loginController = [[BOUILoginController alloc] init];
    //
    //    DPNavigationController *navigationController = [[DPNavigationController alloc] initWithRootViewController: loginController];
    //    //    popupController = [[NSViewController alloc] init];
    //    //    popupController.view = loginController.view;
    //    popupController = navigationController;
    //
    //
    //    // create icon images shown in statusbar
    //    NSImage *alternateImage = [NSImage imageNamed: @"stopwatch2-on-icon"];
    //
    //    statusItemPopup = [[AXStatusItemPopup alloc] initWithViewController: popupController image: image alternateImage: alternateImage];
}


- (void) testTextView {
    self.windowController = [[TextViewWindowController alloc] init];
}

- (void) testLogs {

    BOLogsController *controller = [[BOLogsController alloc] init];
    [controller.items addObject: [[Log alloc] initWithTitle: @"Log"]];


    //    NSArray *allLogs = [_model.apiModel.tasks valueForKeyPath: @"@distinctUnionOfArrays.logs"];
    //
    //    if ([allLogs count] > 0) {
    //        Log *log = [allLogs objectAtIndex: 0];
    //        //        NSLog(@"setting title");
    //        //        log.title = [NSString stringWithFormat: @"%@%@", log.title, log.title];
    //    }

}



#pragma mark BOAPIDelegate

- (void) userDidLogin: (User *) user {
    NSLog(@"%s", __PRETTY_FUNCTION__);
    statusItemView.windowController = [[Counter2WindowController alloc] init];
    [_model.queue addOperation: [[GetTasksOperation alloc] init]];
}

- (void) tasksDidUpdate {
    //    self.windowController = [[TableWindowController alloc] init];
    //    self.windowController = [[CounterWindowController alloc] init];
    //    self.windowController = [[StopwatchWindowController alloc] init];

    //    testController = [[EmptyWindowController alloc] init];
    //    [testController.window makeKeyAndOrderFront: nil];

}


#pragma mark Window controller


- (void) setWindowController: (NSWindowController *) windowController1 {
    [DPWindowManager manager].windowController = windowController1;
}

- (void) setupDeveloperItems {
    NSMenu *menu = [NSApplication sharedApplication].menu;
    NSMenuItem *developerItem = [menu itemWithTitle: @"Developer"];

    if ([developerItem hasSubmenu]) {
        NSMenu *submenu = developerItem.submenu;
        [submenu removeAllItems];

        windowNibs = [[[NSBundle mainBundle] windowNibs] mutableCopy];
        [windowNibs removeObject: @"CounterWindow.nib"];
        [windowNibs removeObject: @"EmptyWindow.nib"];

        for (int j = 0; j < [windowNibs count]; j++) {
            NSString *string = [windowNibs objectAtIndex: j];
            NSString *title = [string stringByReplacingOccurrencesOfString: @"Window.nib" withString: @" Window"];
            [submenu addItemWithTitle: title action: @selector(handleWindowMenuItem:) keyEquivalent: [NSString stringWithFormat: @"%i", j + 1]];
        }
    }

}


- (void) handleWindowMenuItem: (id) sender {
    int index = [[sender menu] indexOfItem: sender];

    NSString *windowNib = [windowNibs objectAtIndex: index];
    NSString *className = [windowNib stringByReplacingOccurrencesOfString: @".nib" withString: @"Controller"];
    [self launchWindowWithClass: NSClassFromString(className)];
}


- (void) launchWindowWithClass: (Class) class {
    [DPWindowManager toggleWindowOfClass: class];
}


@end
