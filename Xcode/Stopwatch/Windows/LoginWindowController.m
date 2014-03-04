//
// Created by Dani Postigo on 1/30/14.
// Copyright (c) 2014 Dani Postigo. All rights reserved.
//

#import <BOAPI/BOLoginOperation.h>
#import <BOAPI/BOAPIModel.h>
#import <DPWindow/DPHeaderedWindow.h>
#import "LoginWindowController.h"
#import "Model.h"
#import "NSWindowController+DPWindow.h"
#import "DPWindow.h"
#import "BOUILoginController.h"
#import "BOUILoginController.h"

@implementation LoginWindowController

- (void) windowDidLoad {
    [super windowDidLoad];

    if (self.headeredWindow) {
        controller = [[BOUILoginController alloc] init];
        self.headeredWindow.contentContentView = controller.view;
    }

    //    userField.stringValue = _model.apiModel.lastSuccessfulUsername == nil ? @"" : [_model.apiModel.lastSuccessfulUsername lowercaseString];
    //    passwordField.stringValue = _model.apiModel.lastPassword == nil ? @"" : _model.apiModel.lastPassword;
}


- (IBAction) submit: (id) sender {
    [_model.queue addOperation: [[BOLoginOperation alloc] initWithUsername: self.userValue password: self.passwordValue]];
}


- (NSString *) userValue {
    return userField.stringValue;
}

- (NSString *) passwordValue {
    return passwordField.stringValue;
}
@end