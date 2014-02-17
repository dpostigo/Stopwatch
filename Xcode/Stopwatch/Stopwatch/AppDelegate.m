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
#import "AppDelegate.h"
#import "User.h"
#import "BOAPIModel.h"
#import "LoginWindowController.h"
#import "StopwatchWindowController.h"
#import "Model.h"
#import "TreeWindowController.h"
#import "LogsWindowController.h"
#import "LogDetailsController.h"
#import "EmptyWindowController.h"
#import "AutoCoding.h"
#import "DPArrayStorageObject.h"
#import "BOAPIStorage.h"
#import "BOLogsController.h"
#import "TextViewWindowController.h"
#import "CounterWindowController.h"
#import "TableWindowController.h"

@implementation AppDelegate {
    Model *_model;
    EmptyWindowController *testController;
}

@synthesize windowController;

- (void) applicationDidFinishLaunching: (NSNotification *) aNotification {

    _model = [Model sharedModel];
    [_model.apiModel cleanApplicationSupportFolder];
    //    [_model.apiModel cleanCache];
    [_model.apiModel subscribeDelegate: self];
    _model.apiModel.restrictLogsFetching = NO;
    //    _model.apiModel.loggingEnabled = NO;


    [self setupDeveloperItems];
    self.windowController = [[LoginWindowController alloc] init];
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
    [_model.queue addOperation: [[GetTasksOperation alloc] init]];
}

- (void) tasksDidUpdate {
    self.windowController = [[TableWindowController alloc] init];
    //    self.windowController = [[CounterWindowController alloc] init];

    //    testController = [[EmptyWindowController alloc] init];
    //    [testController.window makeKeyAndOrderFront: nil];

}


#pragma mark Window controller


- (void) setWindowController: (NSWindowController *) windowController1 {
    if (windowController) {
        [windowController.window orderOut: nil];
    }
    windowController = windowController1;
    if (windowController) {
        [windowController showWindow: nil];
    }

}

- (void) setupDeveloperItems {
    NSMenu *menu = [NSApplication sharedApplication].menu;
    NSMenuItem *developerItem = [menu itemWithTitle: @"Developer"];
    NSLog(@"developerItem = %@", developerItem);
}


@end
