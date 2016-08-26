//
//	Location.m
//  ChiLibs
//
//  Created by Allan Evans on 7/8/16.
//  Copyright © 2016 lingo-slingers.org. All rights reserved.
//

#import "Location.h"

@implementation Location

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[@"latitude"] isKindOfClass:[NSNull class]]) {
		self.latitude = dictionary[@"latitude"];
	}	
	if(![dictionary[@"longitude"] isKindOfClass:[NSNull class]]) {
		self.longitude = dictionary[@"longitude"];
	}	
	if(![dictionary[@"needs_recoding"] isKindOfClass:[NSNull class]]) {
		self.needsRecoding = [dictionary[@"needs_recoding"] boolValue];
	}

	return self;
}

- (NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.latitude != nil) {
		dictionary[@"latitude"] = self.latitude;
	}
	if(self.longitude != nil) {
		dictionary[@"longitude"] = self.longitude;
	}
	dictionary[@"needs_recoding"] = @(self.needsRecoding);
	return dictionary;
}

@end