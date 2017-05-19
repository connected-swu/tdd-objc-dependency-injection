//
//  DataHandler.m
//  tddObjcDepInjection
//
//  Created by cl-dev on 2017-05-13.
//  Copyright © 2017 Steven Wu. All rights reserved.
//

#import "DataHandler.h"

@implementation DataHandler

- (void)handleData:(NSDictionary *)data error:(NSError **)error {
    if (!data) {
        *error = [self nilDataError];
    }
}

- (NSError *)betterHandleData:(NSDictionary *)data {
    if (!data) {
        return [NSError errorWithDomain:@"com.tdd.codingkata" code:0 userInfo:@{}];
    }
    return nil;
}

- (NSError *)nilDataError {
    return [NSError errorWithDomain:@"com.tdd.codingkata" code:0 userInfo:@{}];
}

@end
