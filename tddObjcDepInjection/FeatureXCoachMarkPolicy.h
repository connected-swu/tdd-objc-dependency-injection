//
//  FeatureXCoachMarkPolicy.h
//  tddObjcDepInjection
//
//  Created by cl-dev on 2017-05-11.
//  Copyright © 2017 Steven Wu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FeatureXCoachMarkPolicy : NSObject
@property (nonatomic, readonly) BOOL shouldShow;
@property (nonatomic) NSDate *lastDateOfInteraction;
@end


@interface PropertyInjectedFeatureXCoachMarkPolicy : NSObject
@property (nonatomic, readonly) BOOL shouldShow;
@property (nonatomic) NSDate *lastDateOfInteraction;
@property (nonatomic, strong) NSUserDefaults *userDefaults;
@end


@interface ConstructorInjectedFeatureXCoachMarkPolicy : NSObject
@property (nonatomic, readonly) BOOL shouldShow;
@property (nonatomic) NSDate *lastDateOfInteraction;
- (instancetype)initWithUserDefaults:(NSUserDefaults *)userDefaults;
@end

