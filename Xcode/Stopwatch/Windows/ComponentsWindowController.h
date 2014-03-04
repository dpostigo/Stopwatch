//
// Created by Dani Postigo on 2/28/14.
// Copyright (c) 2014 Dani Postigo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ProjectWindowController.h"

@class DPTimerTextField;

@interface ComponentsWindowController : ProjectWindowController {
    IBOutlet  DPTimerTextField *timerTextField;
    IBOutlet  DPTimerTextField *timerTextFieldControls;

    IBOutlet NSTextField *timeInputField;

    IBOutlet NSTextField *dateTimeInputField;

    IBOutlet NSComboBox *comboBox;
}
@end