//
//  NSString+AGE_LibraryHourFormatting.m
//  ChiLibs
//
//  Created by Allan Evans on 7/9/16.
//  Copyright © 2016 lingo-slingers.org. All rights reserved.
//

#import "NSString+AGE_LibraryHourFormatting.h"

@implementation NSString (AGE_LibraryHourFormatting)

- (NSString *)formattedHours
{
    NSMutableArray *hoursArray = [NSMutableArray arrayWithArray:@[@"", @"", @"", @"", @"", @"", @""]];
    NSArray *dayOfWeekArray = @[@"M", @"TU", @"W", @"TH", @"F", @"SA", @"SU"];
    NSArray *formattedDayOfWeekArray = @[@"Monday", @"Tuesday", @"Wednesday", @"Thursday", @"Friday", @"Saturday", @"Sunday"];
    NSArray *hourStringArray = [self componentsSeparatedByString:@"; "];
    // each member of the hourStringArray is at least one entry in a dictionary...
    for (NSString *rawHoursString in hourStringArray)
    {
        NSArray *seperatedDaysAndHours = [rawHoursString componentsSeparatedByString:@": "];
        
        NSArray *abbreviatedDays;
        // if there is a dash, convert to comma format; if there is a comma, follow initial process...
        if ([seperatedDaysAndHours[0] containsString:@"-"])
        {
            // use the days to get all the days needed for the abbreviatedDays array
            NSArray *startStopHoursDayArray = [seperatedDaysAndHours[0] componentsSeparatedByString:@"-"];
            NSUInteger startIndex = [dayOfWeekArray indexOfObject:startStopHoursDayArray[0]];
            NSUInteger stopIndex = [dayOfWeekArray indexOfObject:startStopHoursDayArray[1]];
            NSMutableArray *convertedSepereratedDays = [NSMutableArray array];
            for (NSUInteger j = startIndex; j < stopIndex + 1; j++) {
                [convertedSepereratedDays addObject:dayOfWeekArray[j]];
            }
            abbreviatedDays = [NSArray arrayWithArray:convertedSepereratedDays];
        }
        else
        {
            abbreviatedDays = [seperatedDaysAndHours[0] componentsSeparatedByString:@", "];
        }
        NSString *abbreviatedHours = [seperatedDaysAndHours[1] copy];
        NSString *formattedHoursString = [self formattedHoursForAbbreviatedHours:abbreviatedHours];
        for (NSString *rawDay in abbreviatedDays) {
            NSString *abbreviatedDay = [rawDay stringByReplacingOccurrencesOfString:@" " withString:@""];
            NSUInteger index = [dayOfWeekArray indexOfObject:abbreviatedDay];
            hoursArray[index] = formattedHoursString;
        }
    }
    
    NSMutableString *returnString = [NSMutableString stringWithString:@"Hours:\n"];
    for (int i = 0; i < 7; i++) {
        NSString *hoursString = [NSString stringWithFormat:@"%@: %@", formattedDayOfWeekArray[i], hoursArray[i]];
        [returnString appendString:hoursString];
        if (i < 6) [returnString appendString:@"\n"];
    }
    
    return returnString;
}

- (NSString *)formattedHoursForAbbreviatedHours:(NSString *)abbreviatedHours
{
    if ([abbreviatedHours isEqualToString:@"Closed"]) return abbreviatedHours;
    // seperate open and close hours
    NSArray *openCloseArray = [abbreviatedHours componentsSeparatedByString:@"-"];
    NSMutableString *openTimeString = [NSMutableString stringWithString:[self formattedTimeForAbbreviatedTime:openCloseArray[0]]];
    NSMutableString *closeTimeString = [NSMutableString stringWithString:[self formattedTimeForAbbreviatedTime:openCloseArray[1]]];
    return [NSString stringWithFormat:@"%@ - %@", openTimeString, closeTimeString];
}

- (NSString *)formattedTimeForAbbreviatedTime:(NSString *)abbreviatedTime
{
    NSUInteger endIndex = ([abbreviatedTime length] == 4 ? 2 : 1);
    NSString *numericHourString = [abbreviatedTime substringToIndex:endIndex];
    NSString *ampmString = [abbreviatedTime substringFromIndex:[abbreviatedTime length] - 2];
    return [NSString stringWithFormat:@"%@:00%@", numericHourString, ampmString];
}

@end
