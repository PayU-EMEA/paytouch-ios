//
//  UIAlertView+SimpleAlert.h
//  PayU-SDK-Sample-Application
//
//  Created by Kamil Tustanowski on 08.05.2014.
//  Copyright (c) 2014 PayU. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIAlertView (SimpleAlert)

+ (void)showAlertWithMessage:(NSString *)message
                 buttonTitle:(NSString *)buttonTitle
                 andDelegate:(id)delegate;

@end
