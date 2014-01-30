//
// Created by Dani Postigo on 1/29/14.
// Copyright (c) 2014 Dani Postigo. All rights reserved.
//

#import "DPIntervalTextField.h"

@implementation DPIntervalTextField

- (void) awakeFromNib {
    [super awakeFromNib];

    NSLog(@"self.formatter = %@", self.formatter);

    NSTimeInterval intervalTwoMinutes = 60 * 2;

    self.doubleValue = intervalTwoMinutes;
}



- (NSNumberFormatter *) numberFormatter {
    return self.formatter && [self.formatter isKindOfClass: [NSNumberFormatter class]] ? self.formatter : nil;
}

@end