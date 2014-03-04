//
// Created by Dani Postigo on 1/31/14.
// Copyright (c) 2014 Dani Postigo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SPViewController.h"
#import "DPOutlineViewDelegate.h"
#import "BOAPIDelegate.h"

@class DPOutlineView;
@class LogDetailCardCellView;

@interface LogDetailsController : SPViewController <DPOutlineViewDelegate, BOAPIDelegate> {
    IBOutlet DPOutlineView *outline;
}

@property(nonatomic, strong) DPOutlineView *outline;
@end