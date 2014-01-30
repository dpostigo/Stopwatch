//
//  AppDelegate.m
//  Stopwatch
//
//  Created by Dani Postigo on 1/28/14.
//  Copyright (c) 2014 Dani Postigo. All rights reserved.
//

#import <BOAPI/GetTasksOperation.h>
#import "AppDelegate.h"
#import "User.h"
#import "BOAPIModel.h"
#import "LoginWindowController.h"
#import "StopwatchWindowController.h"
#import "Model.h"

@implementation AppDelegate {
    Model *_model;
}

@synthesize windowController;

- (void) applicationDidFinishLaunching: (NSNotification *) aNotification {
    _model = [Model sharedModel];
    [_model.apiModel subscribeDelegate: self];
    self.windowController = [[LoginWindowController alloc] init];
}



#pragma mark BOAPIDelegate

- (void) userDidLogin: (User *) user {
    [_model.queue addOperation: [[GetTasksOperation alloc] init]];
}

- (void) tasksDidUpdate {
    self.windowController = [[StopwatchWindowController alloc] init];

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


@end
