//
//	Website.m
//  ChiLibs
//
//  Created by Allan Evans on 7/8/16.
//  Copyright © 2016 - 2021 Allan Evans. All rights reserved.
//

#import "Website.h"

@implementation Website

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[@"url"] isKindOfClass:[NSNull class]]) {
		self.url = dictionary[@"url"];
	}	
	return self;
}

- (NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.url != nil) {
		dictionary[@"url"] = self.url;
	}
	return dictionary;
}

@end
