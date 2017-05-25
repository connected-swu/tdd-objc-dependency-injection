
#import <Cedar/Cedar.h>
#import "FeatureXCoachMarkPolicy.h"
#import "MySpecModule.h"

using namespace Cedar::Matchers;
using namespace Cedar::Doubles;

SPEC_BEGIN(FeatureXCoachMarkPolicySpec)

xdescribe(@"FeatureXCoachMarkPolicy", ^{
    __block FeatureXCoachMarkPolicy *subject;
    
    beforeEach(^{
        subject = [[FeatureXCoachMarkPolicy alloc] init];
    });
    
    // tests like these tend to be 'x'd out or deleted in the long run
    // they also tend to erode confidence and overall priority in fixing/making/maintaining a healthy test suite
    it(@"should show feature-X coach mark", ^{
        subject.shouldShow should be_truthy;
    });
    
    describe(@"saving user interaction with feature-X", ^{
        __block NSDate *date;
        beforeEach(^{
            date = [NSDate date];
            subject.lastDateOfInteraction = date;
        });
        it(@"should save interaction date to user default", ^{
            [[NSUserDefaults standardUserDefaults] valueForKey:@"feature_x_key"] should equal(date);
        });
    });
    
    it(@"should fetch the user's last date of interaction with feature-X correctly", ^{
        NSDate *date = [NSDate date];
        subject.lastDateOfInteraction = date;
        // should use instead,
        // [[NSUserDefaults standardUserDefaults] setValue:date forKey:@""];
        subject.lastDateOfInteraction should equal(date);
    });
    it(@"should hide the feature-X coachmark once it has been seen", ^{
        subject.lastDateOfInteraction = [NSDate date];
        subject.shouldShow should be_falsy;
    });
});


xdescribe(@"PropertyInjectedFeatureXCoachMarkPolicy", ^{
    __block PropertyInjectedFeatureXCoachMarkPolicy *subject;
    __block NSUserDefaults *testUserDefaults;
    
    beforeEach(^{
        testUserDefaults = [NSUserDefaults new];
        // this is weird
        subject = [[PropertyInjectedFeatureXCoachMarkPolicy alloc] init];
        subject.userDefaults = testUserDefaults;
        
        /*
        id<BSInjector> injector = [MySpecModule injectorWithCustomWiring:^(id<BSBinder> binder) {
            [binder bind:NSUserDefaults.class toInstance:testUserDefaults];
        }];
        subject = [injector getInstance:PropertyInjectedFeatureXCoachMarkPolicy.class];
         */
    });
    
    it(@"should show feature-X coach mark", ^{
        subject.shouldShow should be_truthy;
    });
    it(@"should save interaction date with feature-X to user default when asked", ^{
        NSDate *date = [NSDate date];
        subject.lastDateOfInteraction = date;
        [testUserDefaults valueForKey:@"feature_x_key"] should equal(date);
    });
    it(@"should fetch the user's last date of interaction with feature-X correctly", ^{
        NSDate *date = [NSDate date];
        subject.lastDateOfInteraction = date;
        subject.lastDateOfInteraction should equal(date);
    });
    it(@"should hide the feature-X coachmark once it has been seen", ^{
        subject.lastDateOfInteraction = [NSDate date];
        subject.shouldShow should be_falsy;
    });
});


xdescribe(@"ConstructorInjectedFeatureXCoachMarkPolicy", ^{
    __block ConstructorInjectedFeatureXCoachMarkPolicy *subject;
    __block NSUserDefaults *testUserDefaults;
    
    beforeEach(^{
        testUserDefaults = nice_fake_for(NSUserDefaults.class);
        subject = [[ConstructorInjectedFeatureXCoachMarkPolicy alloc] initWithUserDefaults:testUserDefaults];
        
        /*
        id<BSInjector> injector = [MySpecModule injectorWithCustomWiring:^(id<BSBinder> binder) {
            [binder bind:NSUserDefaults.class toInstance:testUserDefaults];
        }];
        subject = [injector getInstance:ConstructorInjectedFeatureXCoachMarkPolicy.class];
         */
    });
    
    it(@"should show feature-X coach mark", ^{
        subject.shouldShow should be_truthy;
    });
    it(@"should save interaction date with feature-X to user default when asked", ^{
        NSDate *date = [NSDate date];
        subject.lastDateOfInteraction = date;
        testUserDefaults should have_received(@selector(setValue:forKey:))
        .with(date, @"feature_x_key");
    });
    describe(@"once user has interacted with feature-X", ^{
        __block NSDate *date;
        beforeEach(^{
            date = [NSDate date];
            testUserDefaults stub_method(@selector(valueForKey:))
            .with(@"feature_x_key")
            .and_return(date);
        });
        it(@"should fetch the user's last date of interaction with feature-X when asked", ^{
            subject.lastDateOfInteraction should equal(date);
        });
        it(@"should hide the feature-X coachmark once it has been seen", ^{
            subject.shouldShow should be_falsy;
        });
    });
});

SPEC_END
