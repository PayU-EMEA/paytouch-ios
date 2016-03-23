//
//  UIAlertView+SimpleAlert.h
//  PayU-SDK-Sample-Application
//
//  Created by Kamil Tustanowski on 08.05.2014.
//  Copyright (c) 2014 PayU. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIAlertView (SimpleAlert)

+ (void)showAlertWithDelegate:(id)delegate message:(NSString *)messageFormat, ...;

@end
