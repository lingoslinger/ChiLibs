//
//  LibraryURLSession.m
//  ChiLibs
//
//  Created by Allan Evans on 7/8/16.
//  Copyright © 2016 lingo-slingers.org. All rights reserved.
//

#import "LibraryURLSession.h"

@implementation LibraryURLSession

- (void)sendRequest:(id)sender completionHandler:(CompletionHandler)completionHandler
{
    NSURLSessionConfiguration* sessionConfig = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession* session = [NSURLSession sessionWithConfiguration:sessionConfig delegate:nil delegateQueue:nil];
    NSURL* URL = [NSURL URLWithString:@"https://data.cityofchicago.org/resource/x8fc-8rcq.json"];
    NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:URL];
    request.HTTPMethod = @"GET";
    NSURLSessionDataTask* task = [session dataTaskWithRequest:request completionHandler:completionHandler];
    [task resume];
    [session finishTasksAndInvalidate];
}


@end
