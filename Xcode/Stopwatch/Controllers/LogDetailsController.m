//
// Created by Dani Postigo on 1/31/14.
// Copyright (c) 2014 Dani Postigo. All rights reserved.
//

#import <DPOutlineView/DPOutlineView.h>
#import <BOAPI/Log.h>
#import <DPOutlineView/DPOutlineViewSection.h>
#import <JMSimpleDate/NSDateFormatter+JMSimpleDate.h>
#import <DPOutlineView/DPTableCellView.h>
#import <NSColor-BlendingUtils/NSColor+BlendingUtils.h>
#import <DPOutlineView/DPTableRowView.h>
#import "LogDetailsController.h"
#import "Model.h"
#import "BOAPIModel.h"
#import "NSArray+DPKit.h"
#import "DPOutlineViewItem.h"
#import "NSColor+Crayola.h"
#import "AutoCoding.h"
#import "Task.h"
#import "NSOutlineView+DPKitNibRegistration.h"
#import "NSObject+DPObjectObserver.h"
#import "DPObjectObserver.h"

@implementation LogDetailsController

@synthesize outline;

- (void) setup {
    [super setup];
    [self observeObject: _model key: @"selectedTask"];
}

- (void) awakeFromNib {
    [super awakeFromNib];

    NSLog(@"%s", __PRETTY_FUNCTION__);
    outline.rowViewClass = [DPTableRowView class];
    outline.outlineDelegate = self;
    [outline reloadData];

    [self setupView];

}


- (void) setupView {

    self.view.wantsLayer = YES;
    self.view.layer.backgroundColor = [NSColor controlColor].CGColor;
}

- (void) setOutline: (DPOutlineView *) outline1 {
    outline = outline1;
    [outline registerNibName: @"LogDetailCardCellView" forIdentifier: @"DataCell"];

}

- (void) prepareDatasource {
    [outline clearSections];

    NSArray *allLogs = [_model.apiModel.tasks valueForKeyPath: @"@distinctUnionOfArrays.logs"];

    allLogs = _model.selectedTask.logs;
    NSArray *dates = [[Log datesForLogs: allLogs] sortedArrayUsingDescriptor: [[NSSortDescriptor alloc] initWithKey: @"self" ascending: NO]];

    for (NSDate *date in dates) {
        DPOutlineViewSection *section = [[DPOutlineViewSection alloc] initWithTitle: [NSDateFormatter formattedStringTimeElapsedFromDate: date]];
        NSArray *logs = [Log logsMatchingDate: date logs: allLogs];
        for (Log *log in allLogs) {
            [section addItem: [[DPOutlineViewItem alloc] initWithTitle: log.title objectValue: log]];
        }
        [outline addSection: section];
    }
}



#pragma mark Cells


- (CGFloat) heightForSection: (DPOutlineViewSection *) section {
    return 20;
}


- (CGFloat) heightForItem: (DPOutlineViewItem *) item {
    CGFloat ret = 0;
    NSTableCellView *prototype = [outline.cellStorage objectForKey: @"dataCell"];
    ret = prototype.height;
    return ret;
}


- (void) willDisplayTableCellView: (DPTableCellView *) cellView forItem: (DPOutlineViewItem *) item {

    //    layer.masksToBounds = YES;
    //
    //    layer.shadowColor = [NSColor crayolaMummysTombColor].CGColor;
    //    layer.shadowColor = [NSColor crayolaOuterSpaceColor].CGColor;
    //    layer.shadowOpacity = 1.0;
    //    layer.shadowRadius = 1.0;
    //    layer.shadowOffset = CGSizeMake(0, -1);


}

- (NSColor *) cellBackgroundColor {
    return [NSColor crayolaCoconutColor];
}


#pragma mark BOAPIDelegate

- (void) timeLogsDidUpdate: (Task *) task {
    [outline reloadData];

}


- (void) tasksDidAdd: (Task *) task {
    NSLog(@"%s", __PRETTY_FUNCTION__);

}


#pragma mark Model Delegate

- (void) modelDidUpdate: (Model *) model withSelectedTask: (Task *) task {
    NSLog(@"%s", __PRETTY_FUNCTION__);
    [outline reloadData];
}


@end