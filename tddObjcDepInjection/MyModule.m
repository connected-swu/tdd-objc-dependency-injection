//
//  MyModule.m
//  tddObjcDepInjection
//
//  Created by cl-dev on 2017-05-25.
//  Copyright © 2017 Steven Wu. All rights reserved.
//

#import "MyModule.h"
#import "DataService.h"


@protocol DataServicing <NSObject>
@end


@implementation MyModule

- (void)configure:(id<BSBinder>)binder {
    /*
     This is where our bindings live.
        - Bindings 'wire' your dependencies; you specify (1) configurations, and (2) scopes
        - The 'how' of object instatiation is determined by BSInitializer or BSPropertySet, otherwise vanilla init is used.
     */
    
    
    /*----------------------------------------+
     | (1) 'Configurations'                   |
     +----------------------------------------*/
    
    [binder bind:NSUserDefaults.class toInstance:[NSUserDefaults standardUserDefaults]];
    
    // e.g.  blindside by default infers class keys, so in practice the above line is not needed.
    [binder bind:DataService.class toClass:DataService.class];
    
    // e.g.  you can choose to bind protocol to a specific implementation,
    [binder bind:@protocol(DataServicing) toClass:DataService.class];
    
    // e.g.  you can bind 'string keys' to same objects with differing scopes,
    [binder bind:@"aBrandNewDataService" toClass:DataService.class];
    [binder bind:@"aSingletonDataService" toClass:DataService.class withScope:BSSingleton.scope];
    
    // e.g.  you can bind to any configuration you'd like to specify,
    [binder bind:@"aCustomDataService" toBlock:^id _Nonnull(NSArray * _Nonnull args, id<BSInjector>  _Nonnull injector) {
        // this is executed whenever an object requires the 'aCustomDataService' depdency.
        DataService *customDataService = [injector getInstance:@"aBrandNewDataService"];
        // customDataService.customProperty = [Something new];
        return customDataService;
    }];
    
    
    /*----------------------------------------+
     | (2) 'Scope'                            |
     +----------------------------------------*/
    
    // Notice that we have decided to make DataService a singleton.
    //      - If no explicit scope is specified a new instance is created upon injection.
    [binder bind:DataService.class withScope:BSSingleton.scope];
    
    // You can create your own scope, an example might be a 'SignedInScope' where objects are retained only for the lifetime of an authenticated session.  Managing scopes is tricky, so first think about why you need 'state' before using it!
}

@end
