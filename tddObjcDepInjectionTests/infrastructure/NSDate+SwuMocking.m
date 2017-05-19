//
//  NSDate+SwuMocking.m
//  tddObjcDepInjection
//


#import "NSDate+SwuMocking.h"

@implementation NSDate (SwuMocking)

+ (MockDateBlock)swu_mockDateBlock {
    return ^NSDate *(NSInteger Y, NSInteger M, NSInteger D, NSInteger h, NSInteger m, NSInteger s) {
        NSDateComponents *components = [[NSDateComponents alloc] init];
        components.year = Y;
        components.month = M;
        components.day = D;
        components.hour = h;
        components.minute = m;
        components.second = s;
        return [[NSCalendar currentCalendar] dateFromComponents:components];
    };
}

@end
