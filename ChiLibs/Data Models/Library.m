//
//	Library.m
//  ChiLibs
//
//  Created by Allan Evans on 7/8/16.
//  Copyright © 2016 - 2021 Allan Evans. All rights reserved.
//

#import "Library.h"

@implementation Library

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[@"address"] isKindOfClass:[NSNull class]]) {
		self.address = dictionary[@"address"];
	}	
	if(![dictionary[@"city"] isKindOfClass:[NSNull class]]) {
		self.city = dictionary[@"city"];
	}	
	if(![dictionary[@"cybernavigator"] isKindOfClass:[NSNull class]]) {
		self.cybernavigator = dictionary[@"cybernavigator"];
	}	
	if(![dictionary[@"hours_of_operation"] isKindOfClass:[NSNull class]]) {
		self.hoursOfOperation = dictionary[@"hours_of_operation"];
	}	
	if(![dictionary[@"location"] isKindOfClass:[NSNull class]]) {
		self.location = [[Location alloc] initWithDictionary:dictionary[@"location"]];
	}

	if(![dictionary[@"name_"] isKindOfClass:[NSNull class]]) {
		self.name = dictionary[@"name_"];
	}	
	if(![dictionary[@"phone"] isKindOfClass:[NSNull class]]) {
		self.phone = dictionary[@"phone"];
	}	
	if(![dictionary[@"state"] isKindOfClass:[NSNull class]]) {
		self.state = dictionary[@"state"];
	}	
	if(![dictionary[@"teacher_in_the_library"] isKindOfClass:[NSNull class]]) {
		self.teacherInTheLibrary = dictionary[@"teacher_in_the_library"];
	}	
	if(![dictionary[@"website"] isKindOfClass:[NSNull class]]) {
		self.website = [[Website alloc] initWithDictionary:dictionary[@"website"]];
	}

	if(![dictionary[@"zip"] isKindOfClass:[NSNull class]]) {
		self.zip = dictionary[@"zip"];
	}	
	return self;
}

- (NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.address != nil) {
		dictionary[@"address"] = self.address;
	}
	if(self.city != nil) {
		dictionary[@"city"] = self.city;
	}
	if(self.cybernavigator != nil) {
		dictionary[@"cybernavigator"] = self.cybernavigator;
	}
	if(self.hoursOfOperation != nil) {
		dictionary[@"hours_of_operation"] = self.hoursOfOperation;
	}
	if(self.location != nil) {
		dictionary[@"location"] = [self.location toDictionary];
	}
	if(self.name != nil) {
		dictionary[@"name_"] = self.name;
	}
	if(self.phone != nil) {
		dictionary[@"phone"] = self.phone;
	}
	if(self.state != nil) {
		dictionary[@"state"] = self.state;
	}
	if(self.teacherInTheLibrary != nil) {
		dictionary[@"teacher_in_the_library"] = self.teacherInTheLibrary;
	}
	if(self.website != nil) {
		dictionary[@"website"] = [self.website toDictionary];
	}
	if(self.zip != nil) {
		dictionary[@"zip"] = self.zip;
	}
	return dictionary;

}

@end
