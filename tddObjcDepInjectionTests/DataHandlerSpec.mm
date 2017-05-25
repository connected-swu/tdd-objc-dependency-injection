
#import <Cedar/Cedar.h>
#import "DataHandler.h"

using namespace Cedar::Matchers;
using namespace Cedar::Doubles;

SPEC_BEGIN(DataHandlerSpec)

xdescribe(@"DataHandler", ^{
    __block DataHandler *subject;
    __block NSError *outcomeError;
    beforeEach(^{
        // outcomeError = nil;
        subject = [DataHandler new];
    });
    
    it(@"should produce an error if nil data supplied", ^{
        [subject handleData:nil error:&outcomeError];
        outcomeError.domain should equal(@"com.tdd.codingkata");
    });
    it(@"should not produce an error if non-nill data supplied", ^{
        [subject handleData:@{} error:&outcomeError];
        outcomeError.domain should be_nil;
    });
});

xdescribe(@"experiment", ^{
    __block NSString *hello;
    it(@"should be nil", ^{
        hello should be_nil;
    });
    it(@"should not be nil", ^{
        hello = @"hello";
        hello should equal(@"hello");
    });
});

xdescribe(@"BetterDataHandler", ^{
    __block DataHandler *subject;
    beforeEach(^{
        subject = [DataHandler new];
    });
    
    it(@"should produce an error if nil data supplied", ^{
        [subject betterHandleData:nil].domain should equal(@"com.tdd.codingkata");
    });
    it(@"should not produce an error if non-nill data supplied", ^{
        [subject betterHandleData:@{}].domain should be_nil;
    });
});

SPEC_END
