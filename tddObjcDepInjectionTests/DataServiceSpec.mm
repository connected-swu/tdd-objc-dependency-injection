#import <Cedar/Cedar.h>
#import "DataService.h"

#import "NSDate+SwuMocking.h"

using namespace Cedar::Matchers;
using namespace Cedar::Doubles;

SPEC_BEGIN(DataServiceSpec)

xdescribe(@"DataService", ^{
    __block DataService *subject;
    __block id<LocationApiClient> testLocationApiClient;

    beforeEach(^{
        testLocationApiClient = nice_fake_for(@protocol(LocationApiClient));
        subject = [[DataService alloc] initWithLocationApiClient:testLocationApiClient];
    });
    
    describe(@"handling location info", ^{
        subjectAction(^{
            [subject locationInfo];
        });
        context(@"when last data cache date more than 5 days ago", ^{
            beforeEach(^{
                spy_on(subject);
                subject stub_method(@selector(lastUpdateLessThan5DaysAgo))
                .and_return(NO);
            });
            it(@"should make a location data request", ^{
                testLocationApiClient should have_received(@selector(refreshDataSuccess:failure:));
            });
        });
        context(@"when last data cache date is 5 days ago", ^{
            beforeEach(^{
                spy_on(subject);
                subject stub_method(@selector(lastUpdateLessThan5DaysAgo))
                .and_return(NO);
            });
            it(@"should make a location data request", ^{
                testLocationApiClient should have_received(@selector(refreshDataSuccess:failure:));
            });
        });
        context(@"when last data cache date is less than 5 days ago", ^{
            beforeEach(^{
                spy_on(subject);
                subject stub_method(@selector(lastUpdateLessThan5DaysAgo))
                .and_return(YES);
            });
            it(@"should make a location data request", ^{
                testLocationApiClient should_not have_received(@selector(refreshDataSuccess:failure:));
            });
        });
    });
    
});


xdescribe(@"BetterDataService", ^{
    __block DataService *subject;
    __block id<LocationApiClient> testLocationApiClient;
    __block NSUserDefaults *testUserDefaults;
    
    beforeEach(^{
        testLocationApiClient = nice_fake_for(@protocol(LocationApiClient));
        testUserDefaults = nice_fake_for(NSUserDefaults.class);
        subject = [[DataService alloc] initWithLocationApiClient:testLocationApiClient
                                                    userDefaults:testUserDefaults];
    });
    
    describe(@"handling location info", ^{
        subjectAction(^{
            [subject locationInfo];
        });
        context(@"when last data cache date more than 5 days ago", ^{
            beforeEach(^{
                spy_on(NSDate.class);
                NSDate.class stub_method(@selector(date))
                .and_return(SwuMockDate(2017, 5, 18, 0, 0, 0));
                testUserDefaults stub_method(@selector(objectForKey:))
                .with(@"data_cache_date_key")
                .and_return(SwuMockDate(2017, 5, 12, 23, 59, 59));
            });
            it(@"should make a location data request", ^{
                testLocationApiClient should have_received(@selector(refreshDataSuccess:failure:));
            });
        });
        context(@"when last data cache date is 5 days ago", ^{
            beforeEach(^{
                spy_on(NSDate.class);
                NSDate.class stub_method(@selector(date))
                .and_return(SwuMockDate(2017, 5, 18, 0, 0, 0));
                testUserDefaults stub_method(@selector(objectForKey:))
                .with(@"data_cache_date_key")
                .and_return(SwuMockDate(2017, 5, 13, 0, 0, 0));
            });
            it(@"should make a location data request", ^{
                testLocationApiClient should have_received(@selector(refreshDataSuccess:failure:));
            });
        });
        context(@"when last data cache date is less than 5 days ago", ^{
            beforeEach(^{
                spy_on(NSDate.class);
                NSDate.class stub_method(@selector(date))
                .and_return(SwuMockDate(2017, 5, 18, 0, 0, 0));
                testUserDefaults stub_method(@selector(objectForKey:))
                .with(@"data_cache_date_key")
                .and_return(SwuMockDate(2017, 5, 13, 0, 0, 1));
            });
            it(@"should make a location data request", ^{
                testLocationApiClient should_not have_received(@selector(refreshDataSuccess:failure:));
            });
        });
    });
    
});


xdescribe(@"AnotherBetterDataService", ^{
    __block DataService *subject;
    __block id<LocationApiClient> testLocationApiClient;
    __block id<DateProvider> testDateProvider;
    __block NSUserDefaults *testUserDefaults;
    
    beforeEach(^{
        testLocationApiClient = nice_fake_for(@protocol(LocationApiClient));
        testDateProvider = nice_fake_for(@protocol(DateProvider));
        testUserDefaults = nice_fake_for(NSUserDefaults.class);
        subject = [[DataService alloc] initWithLocationApiClient:testLocationApiClient
                                                    dateProvider:testDateProvider
                                                    userDefaults:testUserDefaults];
    });
    
    describe(@"handling location info", ^{
        subjectAction(^{
            [subject locationInfo];
        });
        context(@"when last data cache date more than 5 days ago", ^{
            beforeEach(^{
                testDateProvider stub_method(@selector(now))
                .and_return(SwuMockDate(2017, 5, 18, 0, 0, 0));
                testUserDefaults stub_method(@selector(objectForKey:))
                .with(@"data_cache_date_key")
                .and_return(SwuMockDate(2017, 5, 12, 23, 59, 59));
            });
            it(@"should make a location data request", ^{
                testLocationApiClient should have_received(@selector(refreshDataSuccess:failure:));
            });
        });
        context(@"when last data cache date is 5 days ago", ^{
            beforeEach(^{
                testDateProvider stub_method(@selector(now))
                .and_return(SwuMockDate(2017, 5, 18, 0, 0, 0));
                testUserDefaults stub_method(@selector(objectForKey:))
                .with(@"data_cache_date_key")
                .and_return(SwuMockDate(2017, 5, 13, 0, 0, 0));
            });
            it(@"should make a location data request", ^{
                testLocationApiClient should have_received(@selector(refreshDataSuccess:failure:));
            });
        });
        context(@"when last data cache date is less than 5 days ago", ^{
            beforeEach(^{
                testDateProvider stub_method(@selector(now))
                .and_return(SwuMockDate(2017, 5, 18, 0, 0, 0));
                testUserDefaults stub_method(@selector(objectForKey:))
                .with(@"data_cache_date_key")
                .and_return(SwuMockDate(2017, 5, 13, 0, 0, 1));
            });
            it(@"should make a location data request", ^{
                testLocationApiClient should_not have_received(@selector(refreshDataSuccess:failure:));
            });
        });
    });
    
});


SPEC_END
