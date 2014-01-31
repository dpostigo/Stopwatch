//
// Created by Dani Postigo on 1/11/14.
// Copyright (c) 2014 Elastic Creative. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <BOAPI/BOAPIDelegate.h>
#import "DPOutlineView.h"
#import "DPOutlineViewDelegate.h"
#import "BaseController.h"

@class DPOutlineView;

@interface LogsController : BaseController <BOAPIDelegate, DPOutlineViewDelegate> {
    IBOutlet DPOutlineView *outline;
}

@property(nonatomic, strong) DPOutlineView *outline;
@end