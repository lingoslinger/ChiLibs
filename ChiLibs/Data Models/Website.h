//
//	Website.h
//  ChiLibs
//
//  Created by Allan Evans on 7/8/16.
//  Copyright © 2016 lingo-slingers.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Website : NSObject

@property (nonatomic, strong) NSString *url;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;
- (NSDictionary *)toDictionary;

@end