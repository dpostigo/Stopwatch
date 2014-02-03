//
// Created by Dani Postigo on 1/31/14.
// Copyright (c) 2014 Dani Postigo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseController.h"
#import "DPOutlineViewDelegate.h"
#import "BOAPIDelegate.h"

@class DPOutlineView;

@interface LogsDetailController : BaseController <DPOutlineViewDelegate, BOAPIDelegate> {
    IBOutlet DPOutlineView *outline;
}
@end