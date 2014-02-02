//
// Created by Dani Postigo on 1/10/14.
// Copyright (c) 2014 Elastic Creative. All rights reserved.
//

#import "DPTableRowView.h"

@implementation DPTableRowView

@synthesize showsHideText;
@synthesize selectedColor;

- (id) initWithFrame: (NSRect) frameRect {
    self = [super initWithFrame: frameRect];
    if (self) {

        showsHideText = YES;
        self.wantsLayer = YES;

        CALayer *layer = self.layer;
        layer.backgroundColor = [NSColor whiteColor].CGColor;

    }

    return self;
}

- (void) setFrame: (NSRect) frameRect {
    [super setFrame: frameRect];
    self.layer.bounds = self.bounds;
}


- (void) didAddSubview: (NSView *) subview {
    [super didAddSubview: subview];

    if ([subview isKindOfClass: [NSButton class]]) {

        //        NSLog(@"%s, subview = %@", __PRETTY_FUNCTION__, subview);

        NSButton *button = (NSButton *) subview;
        button.alphaValue = self.showsHideText ? 1 : 0;

//        NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString: @"Hello"];
//        button.attributedStringValue = string;

//        [button setImage: [NSImage imageNamed: NSImageNameGoRightTemplate]];
//        [button setAlternateImage: [NSImage imageNamed: NSImageNameGoRightTemplate]];
        //        [(NSButton *) subview setAlternateImage: [NSImage imageNamed: @"disclosure-open"]];
    }
}



- (void) drawSelectionInRect: (NSRect) dirtyRect {
    //    [super drawSelectionInRect: dirtyRect];
}


@end