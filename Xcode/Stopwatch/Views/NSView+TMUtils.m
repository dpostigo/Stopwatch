//
// Created by Dani Postigo on 2/7/14.
// Copyright (c) 2014 Dani Postigo. All rights reserved.
//

#import <NSColor-BlendingUtils/NSColor+Hex.h>
#import "NSView+TMUtils.h"
#import "NSColor+BlendingUtils.h"
#import "NSColor+Crayola.h"

@implementation NSView (TMUtils)

- (void) styleAsLogsView {
    self.wantsLayer = YES;
    CALayer *layer = self.layer;

    layer.backgroundColor = self.logsBackgroundColor.CGColor;
    layer.cornerRadius = 3.0;
    layer.borderColor = [NSColor lighten: self.logsBackgroundColor amount: 0.5].CGColor;
    layer.borderWidth = 0.5;
    layer.masksToBounds = YES;

    layer.shadowColor = [NSColor crayolaMummysTombColor].CGColor;
    layer.shadowColor = [NSColor crayolaOuterSpaceColor].CGColor;
    layer.shadowOpacity = 1.0;
    layer.shadowRadius = 1.0;
    layer.shadowOffset = CGSizeMake(0, -1);
}

- (NSColor *) logsBackgroundColor {
    return [NSColor colorWithString: @"fbe37d"];
}

@end