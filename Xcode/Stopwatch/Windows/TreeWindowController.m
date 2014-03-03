//
// Created by Dani Postigo on 1/31/14.
// Copyright (c) 2014 Dani Postigo. All rights reserved.
//

#import "TreeWindowController.h"
#import "Task.h"

@implementation TreeWindowController

- (void) windowDidLoad {
    [super windowDidLoad];

    outline.delegate = self;
    outline.floatsGroupRows = NO;

}




- (IBAction) helloFunction: (id) sender {

    NSLog(@"%s", __PRETTY_FUNCTION__);
}

- (IBAction) testButton {
    NSLog(@"%s", __PRETTY_FUNCTION__);
}

- (NSView *) outlineView: (NSOutlineView *) outlineView viewForTableColumn: (NSTableColumn *) tableColumn item: (NSTreeNode *) item {
    //    NSLog(@"item = %@", item);
    //    NSLog(@"item.representedObject = %@", item.representedObject);

    if ([item.representedObject isKindOfClass: [Task class]]) {
        return [outlineView makeViewWithIdentifier: @"HeaderCell" owner: self];
    }
    return [outlineView makeViewWithIdentifier: @"DataCell" owner: self];
}

- (BOOL) outlineView: (NSOutlineView *) outlineView isGroupItem: (NSTreeNode *) item {
    return [[item childNodes] count] > 0;
}

//- (BOOL) outlineView: (NSOutlineView *) outlineView shouldSelectItem: (NSTreeNode *) item {
//    return ![item.representedObject isGroup];
//}



//
//- (BOOL) outlineView: (NSOutlineView *) outlineView isGroupItem: (id) item {
//    Task *task = [item representedObject];
//    NSLog(@"task = %@", task);
//    return [task.logs count] > 0;
//}




@end