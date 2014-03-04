//
// Created by Dani Postigo on 1/30/14.
// Copyright (c) 2014 Dani Postigo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseWindowController.h"

@class BOAPIModel;

@interface ProjectWindowController : BaseWindowController {

    BOAPIModel *apiModel;
}

@property(nonatomic, strong) BOAPIModel *apiModel;
@end