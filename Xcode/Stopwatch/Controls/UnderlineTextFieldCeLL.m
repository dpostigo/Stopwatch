//
// Created by Dani Postigo on 2/1/14.
// Copyright (c) 2014 Dani Postigo. All rights reserved.
//

#import "UnderlineTextFieldCell.h"

@implementation UnderlineTextFieldCell

@synthesize sides;

- (void) drawInteriorWithFrame: (NSRect) cellFrame inView: (NSView *) controlView {
    [super drawInteriorWithFrame: cellFrame inView: controlView];



    NSLog(@"cellFrame = %@", NSStringFromRect(cellFrame));
    NSRect bounds = self.controlView.bounds;

    NSLog(@"[self titleRectForBounds: bounds] = %@", NSStringFromRect([self titleRectForBounds: bounds]));
    NSLog(@"[self titleRectForBounds: cellFrame] = %@", NSStringFromRect([self titleRectForBounds: cellFrame]));

    NSLog(@"[self drawingRectForBounds: bounds] = %@", NSStringFromRect([self drawingRectForBounds: bounds]));
    NSLog(@"[self drawingRectForBounds: cellFrame] = %@", NSStringFromRect([self drawingRectForBounds: cellFrame]));
    [[NSColor clearColor] set];
    NSFrameRectWithWidthUsingOperation(bounds, 1, NSCompositeSourceOut);


}

- (void) drawWithFrame: (NSRect) cellFrame inView: (NSView *) controlView {
    [super drawWithFrame: cellFrame inView: controlView];

    NSRect bounds = self.controlView.bounds;


    NSRect lineRect = NSMakeRect(0, bounds.size.height - 1, bounds.size.width, 1);
    lineRect = [self titleRectForBounds: self.controlView.bounds];
    lineRect.size.height = 1;
    lineRect.origin.y = bounds.size.height -1;
    [[NSColor colorWithDeviceWhite: 0.0 alpha: 0.1] set];
    NSRectFillUsingOperation(lineRect, NSCompositeSourceOver);

}

//
//
//- (NSRect) drawingRectForBounds: (NSRect) theRect {
//    NSRect ret = [super drawingRectForBounds: theRect];
//    ret = NSInsetRect(ret, self.paddingX, self.paddingY);
//    ret.origin.y = 0;
//    return ret;
//}

//
//- (NSRect) titleRectForBounds: (NSRect) theRect {
//    NSRect ret = [super titleRectForBounds: theRect];
//    ret = NSInsetRect(ret, self.paddingX, self.paddingY);
//    //    NSLog(@"ret = %@", NSStringFromRect(ret));
//    return ret;
//}

- (NSSize) cellSizeForBounds: (NSRect) aRect {
    NSSize ret = [super cellSizeForBounds: aRect];
    ret.width += self.paddingX * 2;
    ret.height += self.paddingY * 2;
    return ret;
}

- (CGFloat) paddingX {
    return 0.0;
}

- (CGFloat) paddingY {
    return 5.0;
}


@end