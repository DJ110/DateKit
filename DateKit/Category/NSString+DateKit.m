//
//  NSString+DateKit.m
//  DateKit
//
//  Created by 伊藤大司 on 3/1/14.
//  Copyright (c) 2014 DJ110. All rights reserved.
//

#import "NSString+DateKit.h"

@implementation NSString (DateKit)

-(NSDate *)parseYYYYMMddD {
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"YYYY-MM-dd"];
    return [formatter dateFromString:self];
}

-(NSDate *)parseYYYYMMddS {
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"YYYY/MM/dd"];
    return [formatter dateFromString:self];
}

-(NSDate *)parseH {
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm"];
    return [formatter dateFromString:self];
}

-(NSDate *)parseWithoutSec {
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm"];
    return [formatter dateFromString:self];
}

-(NSDate *)parseFull {
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    return [formatter dateFromString:self];
}

@end
