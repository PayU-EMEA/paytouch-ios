//
//  PUPaymentMethodViewControllerDelegate.h
//  PayU-iOS-SDK-Oneclick
//
//  Created by Przemyslaw Stasiak on 05.08.2014.
//  Copyright (c) 2014 PayU S.A. All rights reserved.
//

#import <Foundation/Foundation.h>

@class PUPaymentMethodViewController;

/**
 *  The delegate of PUPaymentMethodViewController should adopt PUPaymentMethodViewControllerDelegate protocol.
 */
__deprecated_msg("Use PaymentMethodWidget to present selected payment method instead");
@protocol PUPaymentMethodViewControllerDelegate <NSObject>

/**----------------------------------------------------------------------
 *  @name Notifying delegate about payment method selection
 * ----------------------------------------------------------------------
 */
@optional
/**
 *  Method for notifying delegate about payment method selection.
 *
 *  @param viewController Notifying UIViewController subclass.
 *  @param paymentMethod  Selected payment method.
 */
- (void)paymentMethodViewController:(PUPaymentMethodViewController *)viewController
             didSelectPaymentMethod:(PUPaymentMethodDescription *)paymentMethod;

@end
