//
// Created by Dani Postigo on 1/31/14.
// Copyright (c) 2014 Dani Postigo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseController.h"
#import "DPOutlineViewDelegate.h"

@class DPOutlineView;

@interface LogsDetailController : BaseController <DPOutlineViewDelegate> {
    IBOutlet DPOutlineView *outline;
}
@end