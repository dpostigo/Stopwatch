//
// Created by Dani Postigo on 3/3/14.
// Copyright (c) 2014 Dani Postigo. All rights reserved.
//

#import "MainWindowController.h"
#import "NSWindow+DPKit.h"
#import "NSView+NewConstraint.h"
#import "NSBundle+DPKit.h"

@implementation MainWindowController

- (void) awakeFromNib {
    [super awakeFromNib];


    //    segmentedControl.segment
    //    NSArray *windowNibs = [[NSBundle mainBundle] windowNibs];
    //
    //    for (int j = 0; j < [windowNibs count]; j++) {
    //        NSString *string = [windowNibs objectAtIndex: j];
    //        NSString *title = [string stringByReplacingOccurrencesOfString: @"Window.nib" withString: @" Window"];
    //        [submenu addItemWithTitle: title action: @selector(handleWindowMenuItem:) keyEquivalent: [NSString stringWithFormat: @"%i", j + 1]];
    //    }

    NSArray *controllers = @[
            @"CounterWindow",
            @"Counter2Window",
            @"DataWindow",
            @"LogPadWindow",
            @"StreamWindow"
    ];
    //    NSMutableArray *controllers = [NSMutableArray arrayWithArray: [[NSBundle mainBundle] windowNibs]];
    //    [controllers removeObject: @"MainWindow.xib"];

    for (int j = 0; j < [controllers count]; j++) {

        NSString *string = [controllers objectAtIndex: j];
        string = [string stringByReplacingOccurrencesOfString: @"Window.nib" withString: @"Window"];
        NSString *controllerString = [NSString stringWithFormat: @"%@Controller", string];
        NSWindowController *controller = [[NSClassFromString(controllerString) alloc] init];


        NSView *contentView = controller.window.contentAsView;


        NSTabViewItem *tabViewItem;
        NSTabView *view;
        if (j < [tabView.tabViewItems count]) {
            tabViewItem = [tabView tabViewItemAtIndex: j];

            //            [view addSubview: contentView];

        } else {
            tabViewItem = [[NSTabViewItem alloc] initWithIdentifier: [NSString stringWithFormat: @"%i", j]];
            [tabView addTabViewItem: tabViewItem];

            //            view = tabViewItem.tabView;

            //            NSView *contentView = controller.window.contentAsView;
            //            contentView.frame = tabView.contentRect;
            //            [view addSubview: contentView];
        }

        contentView.frame = tabView.contentRect;
        tabViewItem.view = contentView;
        tabViewItem.label = string;

    }




    //    NSTabViewItem *item = [[NSTabViewItem alloc] init];
    //    NSTabView *tabView = [[NSTabView alloc] initWithFrame: NSMakeRect(10, 10, 300, 300)];
    //    [[window contentView] addSubview: tabView];

    //    NSTabViewItem *item = [[NSTabViewItem alloc] initWithIdentifier: @"tab1"];

}

@end