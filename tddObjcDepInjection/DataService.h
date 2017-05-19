//
//  DataService.h
//  tddObjcDepInjection
//
//  Created by cl-dev on 2017-05-13.
//  Copyright © 2017 Steven Wu. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol LocationApiClient <NSObject>
- (void)refreshDataSuccess:(void(^)(id))success
                   failure:(void(^)(NSError *))failure;
@end

@protocol DateProvider <NSObject>
- (NSDate *)now;
@end


@interface DataService : NSObject
- (instancetype)initWithLocationApiClient:(id<LocationApiClient>)locationApiClient;
- (id)locationInfo;
- (BOOL)lastUpdateLessThan5DaysAgo;


- (instancetype)initWithLocationApiClient:(id<LocationApiClient>)locationApiClient
                             userDefaults:(NSUserDefaults *)userDefaults;
- (instancetype)initWithLocationApiClient:(id<LocationApiClient>)locationApiClient
                             dateProvider:(id<DateProvider>)dateProvider
                             userDefaults:(NSUserDefaults *)userDefaults;
@end

