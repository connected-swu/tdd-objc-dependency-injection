//
//  MySpecModule.m
//  tddObjcDepInjection
//
//  Created by cl-dev on 2017-05-25.
//  Copyright © 2017 Steven Wu. All rights reserved.
//

#import "MySpecModule.h"
#import "DataService.h"


@implementation MySpecModule

+ (id<BSInjector>)injectorWithCustomWiring:(void (^)(id<BSBinder>))wiring {
    MySpecModule *specModule = [MySpecModule new];
    id binderInjector = [Blindside injectorWithModule:specModule];
    if (wiring) {
        wiring(binderInjector);
    }
    return binderInjector;
}

- (void)configure:(id<BSBinder>)binder {
    /*
     This is where our default spec bindings live.
        - We bind NSUserDefaults.class to BS_NULL to prevent test contamination.
        - We bind DataService.class to BS_NULL to prevent real network calls from firing during spec runs.
     */
    
    [binder bind:NSUserDefaults.class toInstance:BS_NULL];
    [binder bind:DataService.class toInstance:BS_NULL];
    
    [binder bind:NSNotificationCenter.class toInstance:BS_NULL];
    [binder bind:UIApplication.class toInstance:BS_NULL];
}

@end
