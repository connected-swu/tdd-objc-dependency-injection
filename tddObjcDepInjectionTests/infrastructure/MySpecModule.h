//
//  MySpecModule.h
//  tddObjcDepInjection
//
//  Created by cl-dev on 2017-05-25.
//  Copyright © 2017 Steven Wu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Blindside/Blindside.h>


@interface MySpecModule : NSObject <BSModule>
+ (id<BSInjector>)injectorWithCustomWiring:(void (^)(id<BSBinder>))wiring;
@end
