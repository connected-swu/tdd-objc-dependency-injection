
#import <Cedar/Cedar.h>
#import "DataHandler.h"

using namespace Cedar::Matchers;
using namespace Cedar::Doubles;

SPEC_BEGIN(DataHandlerSpec)

xdescribe(@"DataHandler", ^{
    __block DataHandler *dataHandler;
    __block NSError *outcomeError;
    beforeEach(^{
        dataHandler = [DataHandler new];
    });
    
    it(@"should produce an error if nil data supplied", ^{
        [dataHandler handleData:nil error:&outcomeError];
        outcomeError.domain should equal(@"com.tdd.codingkata");
    });
    it(@"should not produce an error if non-nill data supplied", ^{
        [dataHandler handleData:@{} error:&outcomeError];
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
    __block DataHandler *dataHandler;
    beforeEach(^{
        dataHandler = [DataHandler new];
    });
    
    it(@"should produce an error if nil data supplied", ^{
        [dataHandler betterHandleData:nil].domain should equal(@"com.tdd.codingkata");
    });
    it(@"should not produce an error if non-nill data supplied", ^{
        [dataHandler betterHandleData:@{}].domain should be_nil;
    });
});

SPEC_END
