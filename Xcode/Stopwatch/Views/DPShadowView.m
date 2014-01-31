//
// Created by Dani Postigo on 1/30/14.
// Copyright (c) 2014 Dani Postigo. All rights reserved.
//

#import "DPShadowView.h"
#import "NSShadow+DPKit.h"

@implementation DPShadowView

- (id) initWithFrame: (NSRect) frameRect {
    self = [super initWithFrame: frameRect];
    if (self) {

        self.wantsLayer = YES;

        CALayer *layer = self.layer;
        layer.masksToBounds = NO;
        self.shadow = [NSShadow shadowWithColor: [NSColor blackColor] radius: 5.0 offset: NSMakeSize(0, 1)];
    }

    return self;
}

- (void) drawRect: (NSRect) dirtyRect {

    NSRect bounds = self.bounds;
    bounds = NSInsetRect(bounds, 10, 10);

    NSBezierPath *path = [NSBezierPath bezierPathWithRect: bounds];

//    [NSGraphicsContext saveGraphicsState];
    //    [[NSColor blackColor] set];
    //    NSRectFillUsingOperation(bounds, NSCompositeSourceOver);
    //    //    NSFrameRectWithWidthUsingOperation(bounds, 1, NSCompositeSourceOver);


    [[NSColor whiteColor] set];
    NSRectFill(bounds);
//    [NSGraphicsContext restoreGraphicsState];

    /*
    NSShadow *shadow = [[NSShadow alloc] init];


    [shadow setShadowBlurRadius: 3.0];
    [shadow setShadowOffset: NSMakeSize(0, -1)];
    [shadow setShadowColor: [NSColor blackColor]];
    [shadow set];
    //
    //    [[NSColor whiteColor] set];
    //    NSRectFill(bounds);

    [NSGraphicsContext saveGraphicsState];
    [[NSGraphicsContext currentContext] setCompositingOperation: NSCompositeSourceOver];

    //    [shadow set];
    //    [[NSColor clearColor] set];
    //    [path fill];

    [shadow set];
    [[NSColor clearColor] setFill];
    [[NSColor blackColor] setStroke];

    NSRectFillUsingOperation(bounds, NSCompositeSourceOver);

    [[NSColor blackColor] set];
    NSFrameRectWithWidthUsingOperation(bounds, 1, NSCompositeSourceOver);

    [NSGraphicsContext restoreGraphicsState];

    */
}

- (BOOL) isOpaque {
    return NO;
}

- (BOOL) wantsDefaultClipping {
    return NO;
}


@end