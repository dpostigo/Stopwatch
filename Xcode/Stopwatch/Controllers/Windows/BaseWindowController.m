//
// Created by Dani Postigo on 1/30/14.
// Copyright (c) 2014 Dani Postigo. All rights reserved.
//

#import "BaseWindowController.h"
#import "Model.h"

@implementation BaseWindowController

- (id) init {
    NSString *windowNibName = [NSStringFromClass([self class]) stringByReplacingOccurrencesOfString: @"Controller" withString: @""];
    return [self initWithWindowNibName: windowNibName];
}

- (id) initWithWindowNibName: (NSString *) windowNibName {
    self = [super initWithWindowNibName: windowNibName];
    if (self) {

        _model = [Model sharedModel];
    }

    return self;
}


- (void) windowDidLoad {
    [super windowDidLoad];
}


+ (void) show {
    BaseWindowController *window = [[[self class] alloc] init];
    [window showWindow: nil];
}

- (Model *) model {
    return _model;
}

@end