//
//  NSDate+DateKit.m
//  DateKit
//
//  Created by 伊藤大司 on 3/1/14.
//  Copyright (c) 2014 DJ110. All rights reserved.
//

#import "NSDate+DateKit.h"

@implementation NSDate (DateKit)

/**
 * NSDate add, sub
 */
-(NSDate *)getAdd:(int)days {
    long second = 24 * 60 * 60 * days;
    return [self dateByAddingTimeInterval:second];
}

-(NSDate *)getSub:(int)days {
    long second = - 24 * 60 * 60 * days;
    return [self dateByAddingTimeInterval:second];
}

/**
 * Get first day, last of month
 */
-(NSDate *)getFirstDateOfMonth {
    return [self setDayOf:1];
}

-(NSDate *)getLastMonthLast {
    return [self setDayOf:0];
}

-(NSDate *)setDayOf:(int)day {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *comps = [calendar components:NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit fromDate:self];
    NSInteger year = [comps year];
    NSInteger month = [comps month];
    NSDateComponents *ret_comps = [[NSDateComponents alloc] init];
    [ret_comps setYear:year];
    [ret_comps setMonth:month];
    [ret_comps setDay:day];
    return [calendar dateFromComponents:ret_comps];
}

/**
 * Month Operations
 */
-(NSDate *)getNextMonthFirst {
    int year = [self getYear];
    int month = [self getMonth];
    
    if ( month == 12 ) {
        month = 1;
        year++;
    }
    else {
        month++;
    }
    return [NSDate getFromYMD:year month:month day:1];
}

/**
 * This is to retrieve data
 */

-(int)getWeekDay {
    NSDateComponents *comps;
    NSCalendar *calendar = [NSCalendar currentCalendar];
    comps = [calendar components:NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSWeekdayCalendarUnit fromDate:self];
    return (int)[comps weekday];
}

-(BOOL)isWeekEnd {
    
    NSDateComponents *comps;
    NSCalendar *calendar = [NSCalendar currentCalendar];
    comps = [calendar components:NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSWeekdayCalendarUnit fromDate:self];
    int week_day = (int)[comps weekday];
    return week_day == 7 || week_day == 1;
}

-(BOOL)isWeekDay {
    return ![self isWeekEnd];
}

-(BOOL)sameDay:(NSDate *)target {
    NSCalendar *calendar1 = [NSCalendar currentCalendar];
    NSDateComponents *comps1 = [calendar1 components:NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSWeekdayCalendarUnit fromDate:self];
    
    NSCalendar *calendar2 = [NSCalendar currentCalendar];
    NSDateComponents *comps2 = [calendar2 components:NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSWeekdayCalendarUnit fromDate:target];
    
    return [comps1 year] == [comps2 year] && [comps1 month] == [comps2 month] && [comps1 day] == [comps2 day];
}

-(int)getDay {
    NSDateComponents *comps;
    NSCalendar *calendar = [NSCalendar currentCalendar];
    comps = [calendar components:NSDayCalendarUnit fromDate:self];
    return (int)comps.day;
}

-(int)getMonth {
    NSDateComponents *comps;
    NSCalendar *calendar = [NSCalendar currentCalendar];
    comps = [calendar components:NSMonthCalendarUnit fromDate:self];
    return (int)comps.month;
}

-(int)getYear {
    NSDateComponents *comps;
    NSCalendar *calendar = [NSCalendar currentCalendar];
    comps = [calendar components:NSYearCalendarUnit fromDate:self];
    return (int)comps.year;
}

-(int)getHour {
    NSDateComponents *comps;
    NSCalendar *calendar = [NSCalendar currentCalendar];
    comps = [calendar components:NSHourCalendarUnit fromDate:self];
    return (int)comps.hour; // This is 24 hours
}

-(int)getMinutes {
    NSDateComponents *comps;
    NSCalendar *calendar = [NSCalendar currentCalendar];
    comps = [calendar components:NSMinuteCalendarUnit fromDate:self];
    return (int)comps.minute;
}

-(int)getSeconds {
    NSDateComponents *comps;
    NSCalendar *calendar = [NSCalendar currentCalendar];
    comps = [calendar components:NSSecondCalendarUnit fromDate:self];
    return (int)comps.second;
}


/**
 * Begin, End of this day
 * These are also for Database
 */
-(NSDate *)begin {
    NSDateComponents *comps;
    NSCalendar *calendar = [NSCalendar currentCalendar];
    comps = [calendar components:NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit fromDate:self];
    NSDateComponents *new_comps = [[NSDateComponents alloc] init];
    [new_comps setYear:comps.year];
    [new_comps setMonth:comps.month];
    [new_comps setDay:comps.day];
    [new_comps setHour:0];
    [new_comps setMinute:0];
    [new_comps setSecond:0];
    return [calendar dateFromComponents:new_comps];
}

-(NSDate *)end {
    NSDateComponents *comps;
    NSCalendar *calendar = [NSCalendar currentCalendar];
    comps = [calendar components:NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit fromDate:self];
    NSDateComponents *new_comps = [[NSDateComponents alloc] init];
    [new_comps setYear:comps.year];
    [new_comps setMonth:comps.month];
    [new_comps setDay:comps.day];
    [new_comps setHour:23];
    [new_comps setMinute:59];
    [new_comps setSecond:59];
    return [calendar dateFromComponents:new_comps];
}

+(NSDate *)getFromYMD:(int)year month:(int)month day:(int)day {
    
    // Verification
    if ( year <= 0 || month <= 0 || day <= 0 ){
        return nil;
    }
    if ( month > 12 ) return nil;
    
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *new_comps = [[NSDateComponents alloc] init];
    [new_comps setYear:year];
    [new_comps setMonth:month];
    [new_comps setDay:day];
    [new_comps setHour:0];
    [new_comps setMinute:0];
    [new_comps setSecond:0];
    return [calendar dateFromComponents:new_comps];
}

-(NSDate *)getFromTime:(int)hour minute:(int)minute second:(int)second {
    // Verification
    if ( hour < 0 || minute < 0 || second < 0 ) return nil;
    if ( hour > 24 || minute > 60 || second > 60 ) return nil;
    
    NSDateComponents *comps;
    NSCalendar *calendar = [NSCalendar currentCalendar];
    comps = [calendar components:NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit fromDate:self];
    NSDateComponents *new_comps = [[NSDateComponents alloc] init];
    [new_comps setYear:comps.year];
    [new_comps setMonth:comps.month];
    [new_comps setDay:comps.day];
    [new_comps setHour:hour];
    [new_comps setMinute:minute];
    [new_comps setSecond:second];
    return [calendar dateFromComponents:new_comps];
}

/**
 * String Format
 */

-(NSString *)formatYear {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy"];
    return [formatter stringFromDate:self];
}

-(NSString *)formatMonth {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"MM"];
    return [formatter stringFromDate:self];
}

-(NSString *)formatDay {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"dd"];
    return [formatter stringFromDate:self];
}

-(NSString *)formatA {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    return [formatter stringFromDate:self];
}

-(NSString *)formatB {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy/MM/dd"];
    return [formatter stringFromDate:self];
}

-(NSString *)formatWithoutSec {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy/MM/dd HH:mm"];
    return [formatter stringFromDate:self];
}

-(NSString *)formatFull {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy/MM/dd HH:mm:ss"];
    return [formatter stringFromDate:self];
}

-(NSString *)formatTime {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"HH:mm"];
    return [formatter stringFromDate:self];
}

-(NSString *)formatTimeFull {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"HH:mm:ss"];
    return [formatter stringFromDate:self];
}

#pragma mark - Compare
-(BOOL)before:(NSDate *)target {
    BOOL res = NO;
    NSComparisonResult comp = [self compare:target];
    switch ( comp ) {
        case NSOrderedAscending:
            res = YES;
            break;
        default:
            res = NO;
            break;
    }
    return res;
}

-(BOOL)after:(NSDate *)target {
    BOOL res = NO;
    NSComparisonResult comp = [self compare:target];
    switch ( comp ) {
        case NSOrderedDescending:
            res = YES;
            break;
        default:
            res = NO;
            break;
    }
    return res;
}

-(BOOL)between:(NSDate *)from to:(NSDate *)to {
    NSComparisonResult comp1 = [self compare:from];
    BOOL res = comp1 == NSOrderedDescending || comp1 == NSOrderedSame;
    if ( res ) {
        NSComparisonResult comp2 = [self compare:to];
        res = comp2 == NSOrderedAscending || comp2 == NSOrderedSame;
    }
    return res;
}


@end
