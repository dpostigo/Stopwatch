//
// Created by Dani Postigo on 3/3/14.
// Copyright (c) 2014 Dani Postigo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CounterWindowController.h"

@interface Counter2WindowController : CounterWindowController {

    IBOutlet NSTabView *tabTimeView;
    NSBackgroundStyle backgroundStyle;
}

@property(nonatomic) NSBackgroundStyle backgroundStyle;
@end