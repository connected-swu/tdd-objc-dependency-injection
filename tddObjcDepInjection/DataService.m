//
//  DataService.m
//  tddObjcDepInjection
//
//  Created by cl-dev on 2017-05-13.
//  Copyright © 2017 Steven Wu. All rights reserved.
//

#import "DataService.h"

static NSString *kDataCacheDateKey = @"data_cache_date_key";

@interface SwuDateProvider : NSObject <DateProvider>
@end
@implementation SwuDateProvider
- (NSDate *)now {
    return [NSDate date];
}
@end


@interface DataService ()
@property (nonatomic, strong) id<LocationApiClient> locationApiClient;
@property (nonatomic, strong) id<DateProvider> dateProvider;
@property (nonatomic, strong) NSUserDefaults *userDefaults;
@end

@implementation DataService

- (instancetype)initWithLocationApiClient:(id<LocationApiClient>)locationApiClient {
    return [[DataService alloc] initWithLocationApiClient:locationApiClient
                                             dateProvider:nil
                                             userDefaults:nil];
}

- (instancetype)initWithLocationApiClient:(id<LocationApiClient>)locationApiClient
                             userDefaults:(NSUserDefaults *)userDefaults {
    return [[DataService alloc] initWithLocationApiClient:locationApiClient
                                             dateProvider:[SwuDateProvider new]
                                             userDefaults:userDefaults];
}

- (instancetype)initWithLocationApiClient:(id<LocationApiClient>)locationApiClient
                             dateProvider:(id<DateProvider>)dateProvider
                             userDefaults:(NSUserDefaults *)userDefaults {
    self = [super init];
    if (self) {
        _locationApiClient = locationApiClient;
        _dateProvider = dateProvider;
        _userDefaults = userDefaults;
    }
    return self;
}
- (id)locationInfo {
    if ([self lastUpdateLessThan5DaysAgo]) {
        return nil;
    }
    [self.locationApiClient refreshDataSuccess:NULL failure:NULL];
    return @"we will learn about testing asynchronous actions in a later kata";
}
- (BOOL)lastUpdateLessThan5DaysAgo {
    NSDate *cacheDate = [self.userDefaults objectForKey:kDataCacheDateKey];
    NSDateComponents *components = [[NSCalendar currentCalendar] components:NSCalendarUnitDay
                                                                   fromDate:cacheDate
                                                                     toDate:[self.dateProvider now]
                                                                    options:0];
    return components.day < 5;
}
@end


