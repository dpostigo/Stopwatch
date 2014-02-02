//
// Created by Dani Postigo on 1/20/14.
// Copyright (c) 2014 Elastic Creative. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSView (NewConstraint)

- (NSLayoutConstraint *) superWidthConstraint;
- (NSLayoutConstraint *) superConstrainWidth;
- (NSLayoutConstraint *) superConstrainWidth: (CGFloat) offset;

- (void) updateSuperHeightConstraint: (CGFloat) offset;
- (NSLayoutConstraint *) superHeightConstraint;
- (NSLayoutConstraint *) superConstrainHeight;
- (NSLayoutConstraint *) superConstrainHeight: (CGFloat) offset;

- (void) updateCenterXConstraint: (CGFloat) offset;
- (NSLayoutConstraint *) superCenterXConstraint;
- (NSLayoutConstraint *) superConstrainCenterX;
- (NSLayoutConstraint *) superConstrainCenterX: (CGFloat) offset;
- (void) updateCenterYConstraint: (CGFloat) offset;
- (NSLayoutConstraint *) superConstrainCenterY;
- (NSLayoutConstraint *) superConstrainCenterY: (CGFloat) offset;
- (void) updateSuperLeadingConstraint: (CGFloat) offset;
- (NSLayoutConstraint *) superLeadingConstraint;
- (NSLayoutConstraint *) superConstrainLeading;
- (NSLayoutConstraint *) superConstrainLeading: (CGFloat) offset;
- (NSLayoutConstraint *) superConstrainLeadingToItem: (id) item;
- (NSLayoutConstraint *) superConstrainLeadingToItem: (id) item offset: (CGFloat) offset;

- (void) updateSuperTrailingConstraint: (CGFloat) offset;
- (NSLayoutConstraint *) superTrailingConstraint;
- (NSLayoutConstraint *) superConstrainTrailing;
- (NSLayoutConstraint *) superConstrainTrailing: (CGFloat) offset;

- (void) updateSuperTopConstraint: (CGFloat) offset;
- (NSLayoutConstraint *) superTopConstraint;
- (NSLayoutConstraint *) superConstrainTop;
- (NSLayoutConstraint *) superConstrainTop: (CGFloat) offset;
- (NSLayoutConstraint *) superConstrainTopToItem: (id) item;


- (void) updateSuperBottomConstraint: (CGFloat) offset;
- (NSLayoutConstraint *) superBottomConstraint;
- (NSLayoutConstraint *) superConstrainBottom;
- (NSLayoutConstraint *) superConstrainBottom: (CGFloat) offset;

- (NSArray *) superConstrainEdges;
- (NSArray *) superConstrainEdges: (CGFloat) offset;

- (void) updateSuperConstraintsWithInsets: (NSEdgeInsets) insets;
- (NSArray *) superConstrainWithInsets: (NSEdgeInsets) insets;


- (NSLayoutConstraint *) superCenterYConstraint;
@end