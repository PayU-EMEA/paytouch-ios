//
//  UIAlertView+SimpleAlert.m
//  PayU-SDK-Sample-Application
//
//  Created by Kamil Tustanowski on 08.05.2014.
//  Copyright (c) 2014 PayU. All rights reserved.
//

#import "UIAlertView+SimpleAlert.h"

@implementation UIAlertView (SimpleAlert)

+ (void)showAlertWithDelegate:(id)delegate message:(NSString *)messageFormat, ... {
    va_list args;
    va_start(args, messageFormat);
    NSString *message = [[NSString alloc] initWithFormat:messageFormat arguments:args];
    va_end(args);
    
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:nil
                                                        message:message
                                                       delegate:delegate
                                              cancelButtonTitle:NSLocalizedString(@"Zamknij", nil)
                                              otherButtonTitles:nil];
    [alertView show];
}

@end
