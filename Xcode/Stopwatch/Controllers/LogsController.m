//
// Created by Dani Postigo on 1/11/14.
// Copyright (c) 2014 Elastic Creative. All rights reserved.
//

#import <BOAPI/ServiceItem.h>
#import <DPOutlineView/DPTableRowView.h>
#import <BOAPI/BOAPIModel.h>
#import <DPKit/NSShadow+DPKit.h>
#import "LogsController.h"
#import "Log.h"
#import "Model.h"
#import "Task.h"
#import "NSArray+BOBasicObject.h"
#import "DPTableCellView.h"
#import "NSArray+DateUtils.h"
#import "NSDateFormatter+JMSimpleDate.h"
#import "NSColor+Crayola.h"
#import "NSColor+BlendingUtils.h"
#import "NSMutableAttributedString+DPKit.h"
#import "DPOutlineViewItem.h"
#import "DPOutlineViewSection.h"
#import "CALayer+ConstraintUtils.h"
#import "CALayer+FrameUtils.h"
#import "NSColor+Hex.h"
#import "GetLogsOperation.h"

@implementation LogsController

@synthesize outline;

- (void) awakeFromNib {
    [super awakeFromNib];

    [outline reloadData];
    [self customizeBackground];
}


- (void) setOutline: (DPOutlineView *) outline1 {
    outline = outline1;
    outline.outlineDelegate = self;
    //    outline.fitsScrollViewToHeight = YES;
}


- (void) customizeBackground {


    //    DPLinedView *linedView = [[DPLinedView alloc] init];
    //    linedView.spacing = outline.rowHeight;
    //    linedView.lineColor = [NSColor crayolaDeepSpaceSparkleColor];
    //    linedView.shadow = [AppStyles shadowWithColor: [NSColor whiteColor] radius: 0.0 offset: NSMakeSize(0, 1)];
    //    [self.view addSubview: linedView];
    //
    //    linedView.translatesAutoresizingMaskIntoConstraints = NO;
    //    linedView.frame = outline.bounds;
    //    linedView.hidden = YES;
    //    [linedView superConstrainWithInsets: NSEdgeInsetsMake(outline.top, 10, 10, 10)];

    self.view.wantsLayer = YES;
    CALayer *layer = self.view.layer;

    //    bgColor = [NSColor crayolaOrangeYellowColor];
    //    bgColor = [NSColor crayolaDandelionColor];
    //    bgColor = [NSColor crayolaYellowColor];

    layer.backgroundColor = self.backgroundColor.CGColor;
    layer.cornerRadius = 3.0;
    layer.borderColor = [NSColor lighten: self.backgroundColor amount: 0.5].CGColor;
    layer.borderWidth = 0.5;
    layer.masksToBounds = YES;

    layer.shadowColor = [NSColor crayolaMummysTombColor].CGColor;
    layer.shadowColor = [NSColor crayolaOuterSpaceColor].CGColor;
    layer.shadowOpacity = 1.0;
    layer.shadowRadius = 1.0;
    layer.shadowOffset = CGSizeMake(0, -1);

}

- (Task *) task {
    return _model.selectedTask;
}



#pragma mark DPOutlineView delegate


- (void) prepareDatasource {
    [outline clearSections];

    if ([self.task.logs count] > 0) {
        DPOutlineViewSection *section;
        NSArray *uniqueDates = [self.task.logDates.uniqueDates sortedArrayUsingDescriptors: [NSArray arrayWithObject: [[NSSortDescriptor alloc] initWithKey: @"self" ascending: NO]]];
        for (NSDate *uniqueDate in uniqueDates) {
            section = [[DPOutlineViewSection alloc] initWithTitle: [NSDateFormatter formattedStringTimeElapsedFromDate: uniqueDate]];
            NSArray *dateLogs = [self.task logsForDate: uniqueDate];
            for (Log *log in dateLogs) {
                [section addItem: [[DPOutlineViewItem alloc] initWithTitle: log.title identifier: log.id]];
            }
            [outline addSection: section];
        }
    }

}

//}

#pragma mark Cells



- (void) willDisplayTableCellView: (DPTableCellView *) view forItem: (DPOutlineViewItem *) item {

    view.wantsLayer = YES;

    CALayer *layer = view.layer;
    //    view.shadow = [AppStyles shadowWithColor: [NSColor whiteColor] radius: 0.0 offset: NSMakeSize(0, 1)];
    //
    //
    //
    //    layer.backgroundColor = [NSColor clearColor].CGColor;
    //
    //    CALayer *rule = [CALayer layer];
    //    rule.backgroundColor = [NSColor crayolaGoldFusionColor].CGColor;
    //    rule.height = 0.25;
    //    [layer makeSuperlayer];
    //    [layer addSublayer: rule];
    //    [rule superConstrainEdgesH: 0];
    //    [rule superConstrainBottomEdge: 0];
    //    rule.opacity = 0.5;
    //    //    layer.backgroundColor = [NSColor clearColor].CGColor;


    Log *log = (Log *) [self.task.logs basicObjectForId: item.identifier];

    if (log) {

        //    view.textField.stringValue = [NSString stringWithFormat: @"%@ - %@", log.serviceItem.title, log.title];

        NSFont *font = view.textLabel.font;
        CGFloat pointSize = font.pointSize;

        if (log.serviceItem) {

            NSColor *fontColor = [self.backgroundColor darken: 0.7];
            //            NSFont *regularFont = [NSFont fontWithName: @"HelveticaNeue" size: pointSize];
            //            NSFont *boldFont = [NSFont fontWithName: @"HelveticaNeue-Medium" size: pointSize];
            NSFont *regularFont = [NSFont fontWithName: @"LucidaGrande" size: pointSize];
            NSFont *boldFont = [NSFont fontWithName: @"LucidaGrande-Bold" size: pointSize];

            NSMutableAttributedString *serviceString = [[NSMutableAttributedString alloc] initWithString: [NSString stringWithFormat: @"%@ ", log.serviceItem.title]];
            [serviceString addAttribute: NSFontAttributeName value: boldFont];
            [serviceString addAttribute: NSForegroundColorAttributeName value: fontColor];

            NSMutableAttributedString *logString = [[NSMutableAttributedString alloc] initWithString: log.title];
            [logString addAttribute: NSFontAttributeName value: regularFont];
            [logString addAttribute: NSForegroundColorAttributeName value: fontColor];

            NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithAttributedString: serviceString];
            [string appendAttributedString: logString];

            view.textLabel.stringValue = string.string;
            view.textLabel.attributedStringValue = string;

            view.detailTextLabel.stringValue = [NSString stringWithFormat: @"%@", log.timeAsString];
            view.detailTextLabel.textColor = self.textColor;
        } else {

            NSLog(@"log = %@", log);
        }
    }

}


- (void) willDisplayTableHeader: (DPTableCellView *) cellView forSection: (DPOutlineViewSection *) section {
    cellView.textLabel.textColor = self.dividerColor;

}


- (void) didSelectItem: (DPOutlineViewItem *) item {
    Log *log = [self.task logForId: item.identifier];
    if (log) {
        //        [_model notifyDelegates: @selector(modelDidSelectLog:) object: log];
    } else {
    }

}


- (NSTableRowView *) rowViewForItem: (id) item {
    DPTableRowView *ret = [[DPTableRowView alloc] init];

    ret.shadow = [NSShadow shadowWithColor: [NSColor colorWithDeviceWhite: 1.0 alpha: 0.9] radius: 0.0 offset: NSMakeSize(0, 0.5)];

    ret.wantsLayer = YES;

    CALayer *layer = ret.layer;
    layer.backgroundColor = [NSColor clearColor].CGColor;
    layer.masksToBounds = NO;

    CALayer *rule = [CALayer layer];
    rule.backgroundColor = self.dividerColor.CGColor;
    rule.height = 0.25;
    [layer makeSuperlayer];
    [layer addSublayer: rule];
    [rule superConstrainEdgesH: 0];
    [rule superConstrainBottomEdge: 0];
    rule.masksToBounds = NO;

    //    rule.shadowOpacity = 1.0;
    //    rule.shadowRadius = 1.0;
    //    rule.shadowOffset = NSMakeSize(0, 1);
    //    rule.shadowColor = [NSColor whiteColor].CGColor;
    rule.opacity = 0.8;

    return ret;
}


- (void) didAddRowView: (NSTableRowView *) rowView {

}



#pragma mark BOAPIDelegate
- (void) modelDidSelectTask: (Task *) task {
    //    [super modelDidSelectTask: task];

    [outline reloadData];

    NSLog(@"_model.selectedTask = %@", _model.selectedTask);
    if (_model.selectedTask) {
        [self.queue addOperation: [[GetLogsOperation alloc] initWithTask: self.task]];
        //[self.task addObserver: self forKeyPath: @"logs" options: 0 context: NULL];
    }
}


- (void) timeLogsDidUpdate: (Task *) task {
    [outline reloadData];
}


- (NSColor *) backgroundColor {
    return [NSColor colorWithString: @"fbe37d"];
}


- (NSColor *) dividerColor {
    return [[NSColor crayolaGoldFusionColor] mix: self.backgroundColor fraction: 0.7];
}


- (NSColor *) textColor {
    return [self.backgroundColor darken: 0.7];
}

@end