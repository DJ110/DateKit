//
//  NSString+DateKit.h
//  DateKit
//
//  Created by 伊藤大司 on 3/1/14.
//  Copyright (c) 2014 DJ110. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (DateKit)

-(NSDate *)parseYYYYMMddD;
-(NSDate *)parseYYYYMMddS;
-(NSDate *)parseH;
-(NSDate *)parseFull;

@end
