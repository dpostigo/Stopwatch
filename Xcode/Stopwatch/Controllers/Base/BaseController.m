//
// Created by Dani Postigo on 1/30/14.
// Copyright (c) 2014 Dani Postigo. All rights reserved.
//

#import "BaseController.h"
#import "Model.h"

@implementation BaseController

- (id) init {
    NSString *nibName = NSStringFromClass([self class]);
    return [self initWithNibName: nibName bundle: nil];
}


- (id) initWithNibName: (NSString *) nibNameOrNil bundle: (NSBundle *) nibBundleOrNil {
    self = [super initWithNibName: nibNameOrNil bundle: nibBundleOrNil];
    if (self) {
        _model = [Model sharedModel];
        [_model subscribeDelegate: self];
        NSLog(@"%s", __PRETTY_FUNCTION__);
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

}

- (NSOperationQueue *) queue {
    return _model.queue;
}
@end