//
// Created by Dani Postigo on 1/29/14.
// Copyright (c) 2014 Dani Postigo. All rights reserved.
//

#import "LoginController.h"
#import "Model.h"
#import "GetTasksOperation.h"
#import "BOLoginOperation.h"

@implementation LoginController

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