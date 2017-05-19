//
//  DataHandler.h
//  tddObjcDepInjection
//
//  Created by cl-dev on 2017-05-13.
//  Copyright © 2017 Steven Wu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataHandler : NSObject
- (void)handleData:(NSDictionary *)data error:(NSError **)error;
- (NSError *)betterHandleData:(NSDictionary *)data;
@end
