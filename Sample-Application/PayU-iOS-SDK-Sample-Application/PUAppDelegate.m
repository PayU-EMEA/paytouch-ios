//
//  PUAppDelegate.m
//  SDK-Sample-Application
//
//  Created by Kamil Tustanowski on 28.04.2014.
//  Copyright (c) 2014 PayU S.A. All rights reserved.
//

#import "PUAppDelegate.h"
#import "PUMainViewController.h"
#import "PUPaymentViewController.h"
#import "AFOAuth2Client.h"
#import "AFJSONRequestOperation.h"
#import "AFNetworking.h"

@implementation PUAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    return YES;
}

- (NSString *)applicationCallbackScheme {
    return @"paytouch-sdk-sample-app-x-callback";
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"PUApplicationOpenURLNotification"
                                                        object:nil
                                                      userInfo:@{UIApplicationLaunchOptionsURLKey : url}];
    return YES;
}

#pragma mark - PUPaymentServiceDataSource
- (void)refreshTokenWithCompletionHandler:(void (^)(NSString *, NSError *))completionHandler
{
    /*
     
     Code that fetch access token from your backend
     
     */
    
    completionHandler(/* access token */, nil); /* Invoke when token is retrieved */
    completionHandler(nil, /* error */); /* Invoke when there was an error */
}

@end
