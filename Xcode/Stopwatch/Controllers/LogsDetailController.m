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
#import "LogsDetailController.h"
#import "Model.h"
#import "BOAPIModel.h"
#import "NSArray+DPKit.h"
#import "DPOutlineViewItem.h"
#import "NSColor+Crayola.h"
#import "AutoCoding.h"
#import "Task.h"

@implementation LogsDetailController

- (void) awakeFromNib {
    [super awakeFromNib];

    [_model.apiModel subscribeDelegate: self];

    //    self.view.wantsLayer = YES;
    //    CALayer *layer = self.view.layer;
    //    layer.backgroundColor = [NSColor darkGrayColor].CGColor;

    outline.rowViewClass = [DPTableRowView class];
    outline.outlineDelegate = self;
    //    outline.allowsSelection = NO;
    [outline reloadData];
}


- (void) prepareDatasource {
    [outline clearSections];

    NSArray *allLogs = [_model.apiModel.tasks valueForKeyPath: @"@distinctUnionOfArrays.logs"];
    NSArray *dates = [[Log datesForLogs: allLogs] sortedArrayUsingDescriptor: [[NSSortDescriptor alloc] initWithKey: @"self" ascending: NO]];

    for (NSDate *date in dates) {
        DPOutlineViewSection *section = [[DPOutlineViewSection alloc] initWithTitle: [NSDateFormatter formattedStringTimeElapsedFromDate: date]];
        NSArray *logs = [Log logsMatchingDate: date logs: allLogs];
        for (Log *log in allLogs) {
            [section addItem: [[DPOutlineViewItem alloc] initWithTitle: log.title objectValue: log]];
        }
        [outline addSection: section];
    }

    NSLog(@"Setting title.");

    //    Log *log = [allLogs objectAtIndex: 0];
    //        [log addObserver: self forKeyPath: @"title" options: (NSKeyValueObservingOptionOld | NSKeyValueObservingOptionPrior | NSKeyValueObservingOptionNew) context: NULL];
    //    log.title = [NSString stringWithFormat: @"%@%@", log.title, log.title];

    //    NSLog(@"[Task codableProperties] = %@", [Task codableProperties]);
}

- (void) observeValueForKeyPath: (NSString *) keyPath ofObject: (id) object change: (NSDictionary *) change context: (void *) context {
    NSLog(@"%s", __PRETTY_FUNCTION__);

    //    [super observeValueForKeyPath: keyPath ofObject: object change: change context: context];
}

#pragma mark Cells


- (CGFloat) heightForSection: (DPOutlineViewSection *) section {
    return 20;
}


//- (CGFloat) heightForItem: (DPOutlineViewItem *) item {
//    return 120;
//}


- (void) willDisplayTableCellView: (DPTableCellView *) cellView forItem: (DPOutlineViewItem *) item {

    cellView.wantsLayer = YES;

    CALayer *layer = cellView.layer;
    layer.backgroundColor = self.cellBackgroundColor.CGColor;
    layer.masksToBounds = NO;

    layer.shadowColor = [NSColor blackColor].CGColor;
    layer.shadowRadius = 1.0;
    layer.shadowOffset = NSMakeSize(0, -1);

    layer.cornerRadius = 5.0;

    layer.borderColor = [NSColor lighten: self.cellBackgroundColor amount: 0.5].CGColor;
    layer.borderWidth = 0.5;
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
    NSLog(@"%s", __PRETTY_FUNCTION__);
    [outline reloadData];

}


@end