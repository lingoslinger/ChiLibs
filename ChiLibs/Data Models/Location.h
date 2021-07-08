//
//	Location.h
//  ChiLibs
//
//  Created by Allan Evans on 7/8/16.
//  Copyright © 2016 - 2021 Allan Evans. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Location : NSObject

@property (nonatomic, strong) NSString *latitude;
@property (nonatomic, strong) NSString *longitude;
@property (nonatomic, assign) BOOL needsRecoding;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;
- (NSDictionary *)toDictionary;

@end
