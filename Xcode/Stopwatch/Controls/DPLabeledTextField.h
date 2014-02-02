//
// Created by Dani Postigo on 2/1/14.
// Copyright (c) 2014 Dani Postigo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DPLabeledTextField : NSTextField {
    NSTextField *label;

}

@property(nonatomic, strong) NSTextField *label;
@end