//
// Created by Dani Postigo on 1/30/14.
// Copyright (c) 2014 Dani Postigo. All rights reserved.
//

#import "SPViewController.h"
#import "Model.h"
#import "BOAPIModel.h"

@implementation SPViewController

- (id) init {
    NSString *nibName = NSStringFromClass([self class]);
    return [self initWithNibName: nibName bundle: nil];
}


- (id) initWithNibName: (NSString *) nibNameOrNil bundle: (NSBundle *) nibBundleOrNil {
    self = [super initWithNibName: nibNameOrNil bundle: nibBundleOrNil];
    if (self) {
        [self setup];
    }

    return self;
}


- (id) initWithCoder: (NSCoder *) coder {
    self = [super initWithCoder: coder];
    if (self) {
        [self setup];
    }

    return self;
}

- (void) setup {
    _model = [Model sharedModel];
    [_model subscribeDelegate: self];
    [_model.apiModel subscribeDelegate: self];

}

- (NSOperationQueue *) queue {
    return _model.queue;
}
@end