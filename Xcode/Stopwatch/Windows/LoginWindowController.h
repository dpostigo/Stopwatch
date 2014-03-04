//
// Created by Dani Postigo on 1/30/14.
// Copyright (c) 2014 Dani Postigo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ProjectWindowController.h"

@class BOUILoginController;

@interface LoginWindowController : ProjectWindowController {

    IBOutlet NSTextField *userField;
    IBOutlet NSTextField *passwordField;
    BOUILoginController *controller;
}
@end