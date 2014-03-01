DateKit
=======

Date related utitlies for iOS
This kit includes NSDate and NSString category to manipulate date.

How to use
--------------
Just copy source files in your project.
- NSDate+DateKit.h 
- NSDate+DateKit.m 
- NSString+DateKit.h
- NSString+DateKit.m

The usage is in Test program(DateKitTests.m)
This is XCTestCase.

License
-------
Copyright 2014. [Daiji Ito] [DJ110].
This library is distributed under the terms of the MIT License (MIT)

Methods
--------------
NSDate methods
- **-(NSDate *)getAdd:(int)days**      	
Add days and return new NSDate
- **-(NSDate *)getSub:(int)days**    	
Sub days and return new NSDate
- **-(NSDate *)getFirstDateOfMonth**	
Get the first day of the month
- **-(NSDate *)getLastMonthLast**		
Get the last day of the month
- **-(NSDate *)getNextMonthFirst**		
Get the first day of the next month 
- **-(int)getWeekDay**					
Get week day number 1:Sunday, 7:Saturday
- **-(BOOL)isWeekEnd**					
Whether this day is week end or not
- **-(BOOL)isWeekDay**					
Whether this day is week day or not
- **-(int)getDay**						
Get day number of this
- **-(int)getMonth**					
Get month number of this
- **-(int)getYear**						
Get year number of this
- **-(int)getHour**						
Get hour number of this(24h)
- **-(int)getMinutes**					
Get minutes number of this
- **-(int)getSeconds**					
Get seconds number of this
- **-(NSDate *)begin**					
Get 00:00:00 of this day
- **-(NSDate *)end**
Get 23:59:59 of this day
- **+(NSDate *)getFromYMD:(int)year month:(int)month day:(int)day**
Create new NSDate using year, month and day
- **-(NSDate *)getFromTime:(int)hour minute:(int)minute second:(int)second**
Set time hour, minute, seconds
- **-(NSString *)formatYear**
Return yyyy format NSString
- **-(NSString *)formatMonth**
Return MM format(only month) NSString
- **-(NSString *)formatDay**			
Return dd format(only day) NSString
- **-(NSString *)formatA**
Return yyyy-MM-dd format NSString
- **-(NSString *)formatB**
Return yyyy/MM/dd format NSString
- **-(NSString *)formatFull**
Return yyyy/MM/dd HH:mm:ss format NSString
- **-(BOOL)before:(NSDate *)target**
Whether this day is before the target or not
- **-(BOOL)after:(NSDate *)target**
Whether this day is after the target or not

NSString methods
- **-(NSDate *)parseYYYYMMddD**        	
Parse NSString(YYYY-MM-dd) and return NSDate
- **-(NSDate *)parseYYYYMMddS**			
Parse NSString(YYYY-MM-dd) and return NSDate
- **-(NSDate *)parseH**					
Parse NSString(YYYY-MM-dd HH:mm) and return NSDate
- **-(NSDate *)parseFull**				
Parse NSString(YYYY-MM-dd HH:mm:ss) and return NSDate

Example
--------------
Add 1 day
```objc
NSDate *today = [NSDate date];
NSDate *tomorrow = [today getAdd:1];
```
Parse String 
```objc
NSString *str = @"2014/03/01";
NSDate *format = [str parseYYYYMMddS];
```

[DJ110]: http://atmarkplant.com



