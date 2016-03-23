//
//  PUAppDelegate.h
//  SDK-Sample-Application
//
//  Created by Kamil Tustanowski on 28.04.2014.
//  Copyright (c) 2014 PayU S.A. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PUAuthorizationDataSource.h"
#import "PUSDK.h"

@interface PUAppDelegate : UIResponder <UIApplicationDelegate, PUAuthorizationDataSource>

@property (strong, nonatomic) UIWindow *window;

@end