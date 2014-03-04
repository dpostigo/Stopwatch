//
// Created by Dani Postigo on 2/12/14.
// Copyright (c) 2014 Dani Postigo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ProjectWindowController.h"
#import "DPTimerTextFieldDelegate.h"
#import "DPTimeInputTextViewDelegate.h"

@class DPTimerDatumView;
@class DPTimerTextField;

@interface CounterWindowController : ProjectWindowController <DPTimerTextFieldDelegate, DPTimeInputTextViewDelegate> {

    IBOutlet NSTextField *startField;
    IBOutlet NSTextField *endField;
    IBOutlet NSTextField *testField;

    IBOutlet NSTextField *autocompleteField;
    IBOutlet DPTimerTextField *timerField;

    IBOutlet NSButton *doneButton;
    IBOutlet DPTimerDatumView *datumView;

}

@property(nonatomic, strong) NSButton *doneButton;
- (void) setupStartField;
- (IBAction) handleToggle: (id) sender;
- (IBAction) handleComplete: (id) sender;
@end