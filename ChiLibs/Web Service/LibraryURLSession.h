//
//  LibraryURLSession.h
//  ChiLibs
//
//  Created by Allan Evans on 7/8/16.
//  Copyright © 2016 - 2021 Allan Evans. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^CompletionHandler)(NSData *data, NSURLResponse *response, NSError *error);

@interface LibraryURLSession : NSURLSession

+ (void)sendRequest:(id)sender completionHandler:(CompletionHandler)completionHandler;

@end
