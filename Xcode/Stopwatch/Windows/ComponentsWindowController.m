//
// Created by Dani Postigo on 2/28/14.
// Copyright (c) 2014 Dani Postigo. All rights reserved.
//

#import "ComponentsWindowController.h"
#import "DPTimerTextField.h"
#import "NSTextField+DPTimeInputTextFieldCell.h"
#import "DPTimeInputTextFieldCell.h"
#import "DPDateTimeInputTextView.h"
#import "NSTextField+DPTimeInputTextView.h"
#import "NSControl+DPKit.h"

@implementation ComponentsWindowController

- (void) awakeFromNib {
    [super awakeFromNib];

    timeInputField.intervalInputFieldEditor.minimumIntervalValue = 60 * 60;
    dateTimeInputField.timeInputCell.customFieldEditor = [[DPDateTimeInputTextView alloc] init];
}


- (IBAction) handleComboBox: (id) sender {
    NSLog(@"%s", __PRETTY_FUNCTION__);
    NSArrayController *arrayController = comboBox.contentValuesObservedObject;

    NSLog(@"comboBox.contentValuesBindingInfo = %@", comboBox.contentValuesBindingInfo);
    //    NSLog(@"comboBox.objectValueOfSelectedItem = %@", comboBox.objectValueOfSelectedItem);

}

@end