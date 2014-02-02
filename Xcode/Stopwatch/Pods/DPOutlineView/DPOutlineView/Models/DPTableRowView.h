//
// Created by Dani Postigo on 1/10/14.
// Copyright (c) 2014 Elastic Creative. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DPTableRowView : NSTableRowView {

    NSColor *selectedColor;
    BOOL showsHideText;
}

@property(nonatomic) BOOL showsHideText;
@property(nonatomic, strong) NSColor *selectedColor;
@end