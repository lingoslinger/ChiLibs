//
//  NSString+AGE_LibraryHourFormatting.m
//  ChiLibs
//
//  Created by Allan Evans on 7/9/16.
//  Copyright © 2016 lingo-slingers.org. All rights reserved.
//

#import "NSString+AGE_LibraryHourFormatting.h"

@implementation NSString (AGE_LibraryHourFormatting)

- (NSString *)formattedHours {
    NSArray *dayOfWeekArray = @[@"Mon.", @"Tue.", @"Wed.", @"Thu.", @"Fri.", @"Sat.", @"Sun."];
    NSArray *formattedDayOfWeekArray = @[@"Monday", @"Tuesday", @"Wednesday", @"Thursday", @"Friday", @"Saturday", @"Sunday"];
    NSString *newHoursString = self;
    NSString *returnString = @"Hours:";
    for (NSString *currentDayOfWeek in dayOfWeekArray ) {
        NSUInteger currentIndex = [dayOfWeekArray indexOfObject:currentDayOfWeek];
        newHoursString = [newHoursString stringByReplacingOccurrencesOfString:currentDayOfWeek withString:formattedDayOfWeekArray[currentIndex]];
    }
    newHoursString = [newHoursString stringByReplacingOccurrencesOfString:@"," withString:@":"];
    NSArray *hoursStringArray = [newHoursString componentsSeparatedByString:@"; "];
    for (NSString *hourString in hoursStringArray) {
        returnString = [returnString stringByAppendingString:[NSString stringWithFormat:@"\n%@", hourString]];
    }
    return returnString;
}

@end
