//
// Created by Dani Postigo on 1/30/14.
// Copyright (c) 2014 Dani Postigo. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BOAPIModel;

@interface Model : NSObject {
    NSOperationQueue *queue;
}

@property(nonatomic, strong) NSOperationQueue *queue;

+ (Model *) sharedModel;
- (BOAPIModel *) apiModel;
@end