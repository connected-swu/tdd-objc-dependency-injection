//
//  FeatureXCoachMarkPolicy.m
//  tddObjcDepInjection
//
//  Created by cl-dev on 2017-05-11.
//  Copyright © 2017 Steven Wu. All rights reserved.
//

#import "FeatureXCoachMarkPolicy.h"

static NSString *kLastDateOfInteractionKey = @"feature_x_key";


#pragma mark - Global State

@implementation FeatureXCoachMarkPolicy
- (BOOL)shouldShow {
    return self.lastDateOfInteraction == nil;
}
- (void)setLastDateOfInteraction:(NSDate *)lastDateOfInteraction {
    [[NSUserDefaults standardUserDefaults] setValue:lastDateOfInteraction forKey:kLastDateOfInteractionKey];
}
- (NSDate *)lastDateOfInteraction {
    return [[NSUserDefaults standardUserDefaults] valueForKey:kLastDateOfInteractionKey];
}
@end


#pragma mark - Property Injection

@implementation PropertyInjectedFeatureXCoachMarkPolicy
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

