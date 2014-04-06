//
//  NSDate+DateKit.h
//  DateKit
//
//  Created by 伊藤大司 on 3/1/14.
//  Copyright (c) 2014 DJ110. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (DateKit)

-(NSDate *)getAdd:(int)days;
-(NSDate *)getSub:(int)days;

-(NSDate *)getFirstDateOfMonth;
-(NSDate *)getLastMonthLast;
-(NSDate *)getNextMonthFirst;

-(int)getWeekDay;
-(BOOL)isWeekEnd;
-(BOOL)isWeekDay;
-(BOOL)sameDay:(NSDate *)target;

-(int)getDay;
-(int)getMonth;
-(int)getYear;
-(int)getHour;
-(int)getMinutes;
-(int)getSeconds;
-(NSDate *)begin;
-(NSDate *)end;

+(NSDate *)getFromYMD:(int)year month:(int)month day:(int)day;
-(NSDate *)getFromTime:(int)hour minute:(int)minute second:(int)second;

-(NSString *)formatYear;
-(NSString *)formatMonth;
-(NSString *)formatDay;
-(NSString *)formatA;
-(NSString *)formatB;
-(NSString *)formatWithoutSec;
-(NSString *)formatFull;
-(NSString *)formatTime;
-(NSString *)formatTimeFull;

-(BOOL)before:(NSDate *)target;
-(BOOL)after:(NSDate *)target;
-(BOOL)between:(NSDate *)from to:(NSDate *)to;

@end
