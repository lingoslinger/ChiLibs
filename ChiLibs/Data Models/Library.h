//
//	Library.h
//  ChiLibs
//
//  Created by Allan Evans on 7/8/16.
//  Copyright © 2016 - 2021 Allan Evans. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Location.h"
#import "Website.h"

@interface Library : NSObject

@property (nonatomic, strong) NSString *address;
@property (nonatomic, strong) NSString *city;
@property (nonatomic, strong) NSString *cybernavigator;
@property (nonatomic, strong) NSString *hoursOfOperation;
@property (nonatomic, strong) Location *location;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *phone;
@property (nonatomic, strong) NSString *state;
@property (nonatomic, strong) NSString *teacherInTheLibrary;
@property (nonatomic, strong) Website *website;
@property (nonatomic, strong) NSString *zip;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;
- (NSDictionary *)toDictionary;

@end
