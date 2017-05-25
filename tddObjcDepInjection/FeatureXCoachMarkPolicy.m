//
//  FeatureXCoachMarkPolicy.m
//  tddObjcDepInjection
//
//  Created by cl-dev on 2017-05-11.
//  Copyright © 2017 Steven Wu. All rights reserved.
//

#import "FeatureXCoachMarkPolicy.h"
#import <Blindside/Blindside.h>

static NSString *kLastDateOfInteractionKey = @"feature_x_key";


#pragma mark - Global State

@implementation FeatureXCoachMarkPolicy
- (BOOL)shouldShow {
    return self.lastDateOfInteraction == nil;
}
- (void)setLastDateOfInteraction:(NSDate *)lastDateOfInteraction {
    [self.myDefaults setValue:lastDateOfInteraction forKey:kLastDateOfInteractionKey];
}
- (NSDate *)lastDateOfInteraction {
    return [self.myDefaults valueForKey:kLastDateOfInteractionKey];
}
- (NSUserDefaults *)myDefaults {
    return [NSUserDefaults standardUserDefaults];
}

@end


#pragma mark - Property Injection

@implementation PropertyInjectedFeatureXCoachMarkPolicy
+ (BSPropertySet *)bsProperties {
    return [BSPropertySet propertySetWithClass:self.class
                                 propertyNames:NSStringFromSelector(@selector(userDefaults)), nil];
}
- (BOOL)shouldShow {
    return self.lastDateOfInteraction == nil;
}
- (void)setLastDateOfInteraction:(NSDate *)lastDateOfInteraction {
    [self.userDefaults setValue:lastDateOfInteraction forKey:kLastDateOfInteractionKey];
}
- (NSDate *)lastDateOfInteraction {
    return [self.userDefaults valueForKey:kLastDateOfInteractionKey];
}
@end


#pragma mark - Constructor Injection

@interface ConstructorInjectedFeatureXCoachMarkPolicy ()
@property (nonatomic, strong) NSUserDefaults *userDefaults;
@end

@implementation ConstructorInjectedFeatureXCoachMarkPolicy
+ (BSInitializer *)bsInitializer {
    return [BSInitializer initializerWithClass:self.class
                                      selector:@selector(initWithUserDefaults:)
                                  argumentKeys:NSUserDefaults.class, nil];
}
- (instancetype)initWithUserDefaults:(NSUserDefaults *)userDefaults {
    self = [super init];
    if (self) {
        _userDefaults = userDefaults;
    }
    return self;
}
- (BOOL)shouldShow {
    return self.lastDateOfInteraction == nil;
}
- (void)setLastDateOfInteraction:(NSDate *)lastDateOfInteraction {
    [self.userDefaults setValue:lastDateOfInteraction forKey:kLastDateOfInteractionKey];
}
- (NSDate *)lastDateOfInteraction {
    return [self.userDefaults valueForKey:kLastDateOfInteractionKey];
}
@end

