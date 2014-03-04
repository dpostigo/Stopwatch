//
// Created by Dani Postigo on 2/12/14.
// Copyright (c) 2014 Dani Postigo. All rights reserved.
//

#import <DPKit/DPTimeInputTextFieldCell.h>
#import "CounterWindowController.h"
#import "DPTimerDatum.h"
#import "DPTimerTextField.h"
#import "NSDate-Utilities.h"
#import "DPTimerDatumView.h"
#import "NSTextField+DPTimeInputTextFieldCell.h"
#import "DPDateTimeInputTextView.h"
#import "NSTextField+DPDateTimeInputTextView.h"
#import "DPTimerCountdownFormatter.h"
#import "NSTextField+DPTimeInputTextView.h"
#import "DPTimeIntervalFormatter.h"

@implementation CounterWindowController

@synthesize doneButton;

- (void) windowDidLoad {
    [super windowDidLoad];

    timerField.timerDelegate = self;

    [self setupStartField];
    [self setupEndTimeField];
    [self setupAutocompleteField];

    testField.formatter = [[NSDateFormatter alloc] init];
    testField.objectValue = [NSDate date];

}

- (void) setupDatumView {
    DPTimerDatum *datum = [[DPTimerDatum alloc] initWithStartDate: [NSDate dateWithHoursBeforeNow: 6] endDate: [NSDate date]];
    [datum.pauses addObject: [[DPTimerDatum alloc] initWithStartDate: [NSDate dateWithHoursBeforeNow: 3] endDate: [NSDate dateWithHoursBeforeNow: 2.5]]];
    datumView.datum = datum;
}

- (void) setupStartField {
    DPDateTimeInputTextView *fieldEditor = [[DPDateTimeInputTextView alloc] init];
    fieldEditor.timeInputDelegate = self;

    startField.timeInputCell.customFieldEditor = fieldEditor;
    startField.dateInputValue = nil;
    NSLog(@"startField.stringValue = %@", startField.stringValue);
}

- (void) setupEndTimeField {
    //    DPDateTimeInputTextView *fieldEditor = [[DPDateTimeInputTextView alloc] init];
    //    fieldEditor.timeInputDelegate = self;
    //    endField.timeInputCell.customFieldEditor = fieldEditor;
    //    [endField setEnabled: NO];

}

- (void) setupAutocompleteField {
    //    autocompleteField.intervalInputFieldEditor.intervalFormatter.showsSeconds = YES;
}

#pragma mark IBActions

- (IBAction) handleToggle: (id) sender {
    [timerField timerToggle: nil];

    NSButton *button = sender;
    button.image = button.state == NSOnState ? [NSImage imageNamed: @"stopwatch2-on-icon"] : [NSImage imageNamed: @"stopwatch2-icon"];
    [button setNeedsDisplay: YES];
}

- (IBAction) handleComplete: (id) sender {

    [timerField reset];
    startField.dateInputValue = nil;
    //startField.dateInputFieldEditor.dateInputValue = nil;
}


#pragma mark DPTimerTextFieldDelegate

- (void) timerTextFieldDidStart: (DPTimerTextField *) textField {

    DPDateTimeInputTextView *fieldEditor;
    fieldEditor = (DPDateTimeInputTextView *) startField.timeInputCell.customFieldEditor;
    fieldEditor.latestDate = timerField.startDate;

    fieldEditor = endField.dateInputFieldEditor;
    if (fieldEditor) {
        fieldEditor.earliestDate = timerField.startDate;
    }

    startField.dateInputValue = timerField.startDate;
    endField.dateInputValue = timerField.startDate;
    [autocompleteField setEnabled: !timerField.isRunning];

}


- (void) timerTextFieldDidPause: (DPTimerTextField *) textField {
    [autocompleteField setEnabled: !timerField.isRunning];
    autocompleteField.minimumIntervalValue = timerField.totalTime;
}


- (void) timerTextFieldDidResume: (DPTimerTextField *) textField {
    [autocompleteField setEnabled: !timerField.isRunning];

}

- (void) timerTextFieldDidIncrementMinute: (DPTimerTextField *) textField {
    NSLog(@"%s", __PRETTY_FUNCTION__);

}


#pragma mark Fields changed values


- (void) timeInputTextView: (DPTimeInputTextView *) textView didChangeValue: (id) value {
    if (textView == startField.timeInputCell.customFieldEditor) {
        DPDateTimeInputTextView *fieldEditor = (DPDateTimeInputTextView *) startField.timeInputCell.customFieldEditor;
        timerField.startDate = fieldEditor.dateValue;

    }
}


@end