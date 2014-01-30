//
// Created by Dani Postigo on 1/10/14.
//

#import "NSArray+DPKit.h"

@implementation NSArray (DPKit)
//
//- (NSArray *) dictionariesWithKeys: (NSArray *) keys objects: (NSArray *) objects length: (NSUInteger) length {
//
//    NSMutableArray *ret = [[NSMutableArray alloc] init];
//    for (NSString *key in keys) {
//
//    }
//    for (int j = 0; j < length; j++) {
//        NSMutableDictionary *dictionary =
//    }
//
//    return ret;
//}

- (NSArray *) objectsOfType: (Class) class {
    NSMutableArray *ret = [[NSMutableArray alloc] init];

    for (id object in self) {
        if ([object isKindOfClass: class]) {
            [ret addObject: object];
        }
    }
    return ret;
}
@end