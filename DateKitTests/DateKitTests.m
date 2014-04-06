//
//  DateKitTests.m
//  DateKitTests
//
//  Created by 伊藤大司 on 3/1/14.
//  Copyright (c) 2014 DJ110. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSDate+DateKit.h"
#import "NSString+DateKit.h"

@interface DateKitTests : XCTestCase

@end

@implementation DateKitTests

- (void)setUp
{
    [super setUp];
}

- (void)tearDown
{
    [super tearDown];
}

-(void)testBeginEnd
{
    // XCTFail(@"No implementation for \"%s\"", __PRETTY_FUNCTION__);
    NSDate *date = [NSDate date];

    NSString *endDate = [NSString stringWithFormat:@"%@ 23:59:59", [date formatB]];
    XCTAssertEqualObjects([[date end] formatFull], endDate, @"end day test");
    NSString *beginDate = [NSString stringWithFormat:@"%@ 00:00:00", [date formatB]];
    XCTAssertEqualObjects([[date begin] formatFull], beginDate, @"begin day test");
}

-(void)testProperty
{
    NSDate *date = [NSDate date];
    NSString *year = [NSString stringWithFormat:@"%d", [date getYear]];
    XCTAssertEqualObjects(year, [date formatYear], @"Get year test");
}

-(void)testWeekday
{
    NSDate *oneday = [NSDate getFromYMD:2014 month:2 day:18];
    NSLog(@"Day %@", [oneday formatA]);
    XCTAssertEqualObjects([oneday formatA], @"2014-02-18", @"Day Test");
    XCTAssertTrue([oneday isWeekDay], @"This is weekday");
    XCTAssertFalse([oneday isWeekEnd], @"This is not weekend");
    XCTAssertEqual([oneday getWeekDay], 3, @"This is Tuesday");
}


-(void)testString {
    NSString *str = @"2014-12-02";
    NSDate *date = [str parseYYYYMMddD];
    NSLog(@"Parse Date %@", [date formatA]);
    XCTAssertEqualObjects([date formatA], @"2014-12-02", @"Conversion is fine");
    //NSLog(@"Current %@", [NSDate date]);  // GMT
}

-(void)testNextPrev {
    NSString *str = @"2014-02-14";
    NSDate *date = [str parseYYYYMMddD];
    NSDate *nextmonthfirst = [date getNextMonthFirst];
    XCTAssertEqualObjects([nextmonthfirst formatA], @"2014-03-01", @"Next month is fine");
    NSDate *last = [nextmonthfirst getLastMonthLast];
    XCTAssertEqualObjects([last formatA], @"2014-02-28", @"Last month is fine");
}

-(void)testTime {
    NSDate *date = [NSDate date];
    NSDate *enddate = [date end];
    int hour = [enddate getHour];
    int minute = [enddate getMinutes];
    int second = [enddate getSeconds];
    XCTAssertEqual(hour, 23, "End hour is 23");
    XCTAssertEqual(minute, 59, "End minutes is 59");
    XCTAssertEqual(second, 59, "End seconds is 59");
}

-(void)testFormat {
    NSString *str = @"2014/03/01";
    NSString *str2 = @"2014/03/01xxx";
    
    NSDate *format = [str parseYYYYMMddS];
    NSDate *format2 = [str2 parseYYYYMMddS];
    
    XCTAssertNotNil(format, @"Parse correctly");
    XCTAssertNil(format2, @"Wrong style");
}

-(void)testBetween {
    NSString *str = @"2014-03-29";
    NSDate *date = [str parseYYYYMMddD];
    NSDate *date2 = [@"2014-03-23" parseYYYYMMddD];
    NSDate *date3 = [[@"2014-03-24" parseYYYYMMddD] getFromTime:0 minute:0 second:0];
    NSDate *date4 = [[@"2014-03-31" parseYYYYMMddD] getFromTime:23 minute:59 second:59];
    NSDate *date5 = [[@"2014-04-01" parseYYYYMMddD] getFromTime:0 minute:0 second:0];
    
    
    NSDate *target1 = [[@"2014-03-24" parseYYYYMMddD] getFromTime:0 minute:0 second:0];
    NSDate *target2 = [[@"2014-03-31" parseYYYYMMddD] getFromTime:23 minute:59 second:59];
    
    XCTAssertTrue([date between:target1 to:target2]);
    XCTAssertFalse([date2 between:target1 to:target2]);
    XCTAssertTrue([date3 between:target1 to:target2]);
    XCTAssertTrue([date4 between:target1 to:target2]);
    XCTAssertFalse([date5 between:target1 to:target2]);
}

-(void)testSameDay {
    NSDate *today = [NSDate date];
    NSDate *begin = [today begin];
    NSDate *end = [today end];
    NSDate *tomorrow = [today getAdd:1];
    
    XCTAssertTrue([begin sameDay:end]);
    XCTAssertFalse([begin sameDay:tomorrow]);
}

@end
