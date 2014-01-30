//
// Created by Dani Postigo on 1/30/14.
// Copyright (c) 2014 Dani Postigo. All rights reserved.
//

#import "RedButton.h"
#import "NSColor+BlendingUtils.h"
#import "CALayer+ConstraintUtils.h"
#import "CALayer+SublayerUtils.h"

@implementation RedButton

@synthesize buttonColor;

- (void) awakeFromNib {
    [super awakeFromNib];
    [self setBordered: NO];

    self.wantsLayer = YES;
//
//    CALayer *layer = self.layer;
//    layer.backgroundColor = self.buttonColor.CGColor;
//    layer.borderColor = self.borderColor.CGColor;
//    layer.borderWidth = 0.5;
//
//    CAGradientLayer *innerLayer = [CAGradientLayer layer];
//    innerLayer.borderColor = self.innerBorderColor.CGColor;
//    innerLayer.borderWidth = 1.0;
//    [layer makeSuperlayer];
//    [layer addSublayer: innerLayer];
//    [innerLayer superConstrainEdges: 1.0];
//
//    layer.cornerRadius = 3.0;
//    [layer setSublayerCornerRadius: 3.0];

}


#pragma mark Getters



- (NSColor *) innerBorderColor {
    return [self.buttonColor lighten: 0.5];
}

- (NSColor *) borderColor {
    return [self.buttonColor darken: 0.5];
}

- (NSColor *) buttonColor {
    if (buttonColor == nil) {
        buttonColor = [NSColor blueColor];
    }
    return buttonColor;
}


@end