//
// Created by Dani Postigo on 2/1/14.
// Copyright (c) 2014 Dani Postigo. All rights reserved.
//

#import "DPLabeledTextField.h"

@implementation DPLabeledTextField

@synthesize label;

- (void) viewDidMoveToSuperview {
    [super viewDidMoveToSuperview];
}

- (void) removeFromSuperview {
    [super removeFromSuperview];
}


- (NSTextField *) label {
    if (label == nil) {
        label = [[NSTextField alloc] init];
    }
    return label;
}

@end