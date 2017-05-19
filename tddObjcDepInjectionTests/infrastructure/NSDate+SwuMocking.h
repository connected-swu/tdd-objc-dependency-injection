//
//  NSDate+SwuMocking.h
//  tddObjcDepInjection
//


#import <Foundation/Foundation.h>


typedef NSDate *(^MockDateBlock)(NSInteger Y, NSInteger M, NSInteger D, NSInteger h, NSInteger m, NSInteger s);

#define SwuMockDate(Y,M,D,h,m,s) [NSDate swu_mockDateBlock](Y,M,D,h,m,s)

@interface NSDate (SwuMocking)
+ (MockDateBlock)swu_mockDateBlock;
@end
