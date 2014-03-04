//
// Created by Dani Postigo on 3/3/14.
// Copyright (c) 2014 Dani Postigo. All rights reserved.
//

#import <DPKit/NSShadow+DPKit.h>
#import <NSColor-BlendingUtils/NSColor+BlendingUtils.h>
#import <NSColor-Crayola/NSColor+Crayola.h>
#import <DPTimer/DPTimerTextField.h>
#import <DPKit/NSTextField+DPTimeInputTextFieldCell.h>
#import <DPKit/DPTimeInputTextFieldCell.h>
#import "Counter2WindowController.h"
#import "NSWindow+DPKit.h"
#import "DPInsetView.h"
#import "SNRHUDWindow.h"
#import "NSBezierPath+MCAdditions.h"
#import "NSTextField+DPKitTextFieldCell.h"
#import "NSView+DPKit.h"

@implementation Counter2WindowController {

}

@synthesize backgroundStyle;

- (void) awakeFromNib {
    [super awakeFromNib];
    self.backgroundStyle = [self.window isKindOfClass: [SNRHUDWindow class]] ? NSBackgroundStyleDark : NSBackgroundStyleLight;

    startField.refusesFirstResponder = YES;

    //    [self setupTimeTabView];
    [self setupDarkStyle];

    startField.kitTextFieldCell.insets = NSEdgeInsetsMake(5, 5, 5, 6);
    endField.kitTextFieldCell.insets = startField.kitTextFieldCell.insets;
    timerField.kitTextFieldCell.insets = startField.kitTextFieldCell.insets;
}

#pragma mark IBActions


- (IBAction) handleToggle: (id) sender {
    [super handleToggle: sender];
    //    startField.font = self.stateFont;
    //    timerField.font = self.stateFont;
}

- (NSFont *) stateFont {
    NSFont *ret = nil;
    if (timerField.isRunning) {
        ret = [NSFont fontWithName: @"HelveticaNeue-Medium" size: startField.font.pointSize];
    } else {
        ret = [NSFont fontWithName: @"HelveticaNeue" size: startField.font.pointSize];
    }
    return ret;
}

#pragma mark Setup




- (void) setupDarkStyle {
    if (self.backgroundStyle == NSBackgroundStyleDark) {
        //        [startField setBordered: NO];
        startField.textColor = [NSColor controlColor];
        startField.timeInputCell.cellDrawingBlock = self.darkTextFieldDrawingBlock;

        //        [endField setBordered: NO];
        endField.textColor = [NSColor controlColor];
        endField.timeInputCell.cellDrawingBlock = self.darkTextFieldDrawingBlock;

        //        [timerField setBordered: NO];
        timerField.textColor = [NSColor controlColor];
        timerField.kitTextFieldCell.cellDrawingBlock = self.darkTextFieldDrawingBlock;

        [self.window.contentAsView recursivelyExecuteBlock: ^(NSView *view) {
            if ([view isKindOfClass: [NSTextField class]]) {
                NSTextField *textField = (NSTextField *) view;


                NSArray *strings = @[
                        @"LOG TIME",
                        @"AUTOCOMPLETION",
                        @"LOG INFORMATION"];
                if ([strings containsObject: textField.stringValue]) {
                    //                    textField.textColor = [NSColor controlColor];

                }
            }
        }];
    }

}

- (void) setupTimeTabView {

    self.window.contentAsView.wantsLayer = YES;
    tabTimeView.wantsLayer = YES;

    CALayer *layer = tabTimeView.layer;


    NSColor *bgColor;

    if (self.backgroundStyle == NSBackgroundStyleLight) {
        bgColor = [NSColor crayolaCoconutColor];
        layer.backgroundColor = bgColor.CGColor;
        layer.masksToBounds = NO;

        tabTimeView.shadow = [NSShadow shadowWithColor: [NSColor blackColor] radius: 1.0 offset: NSMakeSize(0, 0)];

        layer.cornerRadius = 5.0;
        layer.borderColor = [NSColor darken: bgColor amount: 0.5].CGColor;
        layer.borderWidth = 0.5;

    } else if (self.backgroundStyle == NSBackgroundStyleDark) {
        bgColor = [NSColor colorWithDeviceWhite: 0.15 alpha: 1.0];
        //        layer.backgroundColor = bgColor.CGColor;
        //        layer.masksToBounds = NO;
        //
        //        tabTimeView.shadow = [NSShadow shadowWithColor: [NSColor blackColor] radius: 1.0 offset: NSMakeSize(0, -1)];
        //
        //        layer.shadowColor = [NSColor blackColor].CGColor;
        //        layer.shadowRadius = 1.0;
        //        layer.shadowOffset = NSMakeSize(0, 1);

    }
}

- (DPKitTextFieldCellDrawingBlock) darkTextFieldDrawingBlock {
    DPKitTextFieldCellDrawingBlock drawingBlock = ^(NSTextFieldCell *textFieldCell, NSRect drawingRect) {

        [NSGraphicsContext saveGraphicsState];
        CGFloat disabledAlpha = 0.5;
        NSColor *backgroundColor = [NSColor colorWithDeviceWhite: 0.000 alpha: 0.150];
        NSColor *dropshadowColor = [NSColor colorWithDeviceWhite: 1.000 alpha: 0.100];

        if (!textFieldCell.isEnabled) {
            CGContextSetAlpha([[NSGraphicsContext currentContext] graphicsPort], disabledAlpha);
        }

        NSRect backgroundRect = drawingRect;
        backgroundRect.size.height -= 1.f;

        NSBezierPath *backgroundPath = [NSBezierPath bezierPathWithRect: backgroundRect];

        //        if ([textFieldCell drawsBackground]) {
        [backgroundColor set];
        [backgroundPath fill];
        //        }

        //        if ([textFieldCell isBezeled]) {
        NSShadow *innerGlow = [NSShadow new];
        innerGlow.shadowColor = [NSColor colorWithDeviceWhite: 0.000 alpha: 0.300];
        innerGlow.shadowOffset = NSMakeSize(0, 0);
        innerGlow.shadowBlurRadius = 3.0;

        [backgroundPath fillWithInnerShadow: innerGlow];
        NSRect innerShadowRect = NSInsetRect(backgroundRect, -2.f, 0);
        innerShadowRect.size.height *= 2.f;
        NSBezierPath *shadowPath = [NSBezierPath bezierPathWithRect: innerShadowRect];

        NSShadow *innerShadow = [NSShadow new];
        innerShadow.shadowColor = [NSColor colorWithDeviceWhite: 0.000 alpha: 0.400];
        innerShadow.shadowOffset = NSMakeSize(0, -1);
        innerShadow.shadowBlurRadius = 3.0;
        [shadowPath fillWithInnerShadow: innerShadow];

        NSRect dropShadowRect = backgroundRect;
        dropShadowRect.origin.y = NSMaxY(drawingRect) - 1.f;
        [dropshadowColor set];
        [NSBezierPath fillRect: dropShadowRect];
        //        }

        [NSGraphicsContext restoreGraphicsState];
    };
    return drawingBlock;
}

- (DPKitDrawingBlock) darkViewDrawingBlock {
    DPKitDrawingBlock ret = ^(NSRect drawingRect) {

        NSColor *bgColor = [NSColor crayolaCoconutColor];
        NSColor *borderColor = [NSColor lighten: bgColor amount: 0.5];

        [bgColor set];
        [borderColor setStroke];

    };
    return ret;
}


- (void) setupTimeTabView2 {

    self.window.contentAsView.wantsLayer = YES;
    tabTimeView.wantsLayer = YES;

    CALayer *layer = tabTimeView.layer;

    NSColor *bgColor = [NSColor crayolaCoconutColor];
    layer.backgroundColor = bgColor.CGColor;
    layer.masksToBounds = NO;

    tabTimeView.shadow = [NSShadow shadowWithColor: [NSColor blackColor] radius: 1.0 offset: NSMakeSize(0, -1)];

    layer.shadowColor = [NSColor blackColor].CGColor;
    layer.shadowRadius = 1.0;
    layer.shadowOffset = NSMakeSize(0, 1);

    layer.cornerRadius = 5.0;

    layer.borderColor = [NSColor lighten: bgColor amount: 0.5].CGColor;
    layer.borderWidth = 0.5;
}


@end