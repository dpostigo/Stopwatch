//
// Created by Dani Postigo on 1/30/14.
// Copyright (c) 2014 Dani Postigo. All rights reserved.
//

#import <BOAPI/BOLoginOperation.h>
#import <BOAPI/BOAPIModel.h>
#import "LoginWindowController.h"
#import "Model.h"

@implementation LoginWindowController

- (void) windowDidLoad {
    [super windowDidLoad];

    userField.stringValue = _model.apiModel.lastSuccessfulUsername == nil ? @"" :  _model.apiModel.lastSuccessfulUsername;
    passwordField.stringValue = _model.apiModel.lastPassword == nil ? @"" :  _model.apiModel.lastPassword;
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