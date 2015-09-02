//
//  UIAlertView+SimpleAlert.m
//  PayU-SDK-Sample-Application
//
//  Created by Kamil Tustanowski on 08.05.2014.
//  Copyright (c) 2014 PayU. All rights reserved.
//

#import "UIAlertView+SimpleAlert.h"

@implementation UIAlertView (SimpleAlert)

+ (void)showAlertWithMessage:(NSString *)message
                 buttonTitle:(NSString *)buttonTitle
                 andDelegate:(id)delegate
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:nil
                                                        message:message
                                                       delegate:delegate
                                              cancelButtonTitle:NSLocalizedString(@"Zamknij", nil)
                                              otherButtonTitles:nil];
    if (buttonTitle) {
        [alertView addButtonWithTitle:buttonTitle];
    }
    
    [alertView show];
}

@end
