//
//  PUSampleDataProvider.m
//  PayU-SDK-Sample-Application
//
//  Created by Kamil Tustanowski on 30.04.2014.
//  Copyright (c) 2014 PayU. All rights reserved.
//

#import "PUSampleDataProvider.h"
#import "PUItem.h"
#import "PUPaymentMethodDescription.h"

@implementation PUSampleDataProvider

+ (NSDictionary *)sampleCorrectPayment
{
    return [self createContentWithProducts:[PUSampleDataProvider correctPaymentProducts]
                           andPaymentItems:[PUSampleDataProvider correctPaymentItems]];
}

+ (NSDictionary *)sampleIncorrectPayment
{
    return [self createContentWithProducts:[PUSampleDataProvider incorrectPaymentProducts]
                           andPaymentItems:[PUSampleDataProvider incorrectPaymentItems]];
}

+ (NSDictionary *)createContentWithProducts:(NSArray *)products
                            andPaymentItems:(NSArray *)paymentItems
{
    NSString *productsKey = NSLocalizedString(@"Produkty", nil);
    NSString *paymentMethodsKey = NSLocalizedString(@"Płatność", nil);
    
    return @{productsKey : products,
             paymentMethodsKey : paymentItems};
}

+ (NSDictionary *)samplePayments
{
    NSArray *sampleItems = @[NSLocalizedString(@"Kurtka zimowa - autoryzacja", nil),
                             NSLocalizedString(@"Słuchawki - brak autoryzacji", nil)];
    NSString *sampleItemsKey = NSLocalizedString(@"Przykładowe koszyki", nil);
    return @{sampleItemsKey : sampleItems};
}

+ (NSArray *)correctPaymentProducts
{
    PUItem *productOne = [[PUItem alloc] init];
    productOne.name = @"Kurtka zimowa";
    productOne.amount = @501.0;
    productOne.currency = @"PLN";
    
    PUItem *productTwo = [[PUItem alloc] init];
    productTwo.name = NSLocalizedString(@"Przesyłka kurierska", nil);
    productTwo.amount = @15.0;
    productTwo.currency = @"PLN";
    
    return @[productOne, productTwo];
}

+ (NSArray *)correctPaymentItems
{
    PUItem *toPay = [[PUItem alloc] init];
    toPay.name = NSLocalizedString(@"Do zapłaty", nil);
    toPay.amount = @516.0;
    toPay.currency = @"PLN";
    
    return @[toPay];
}

+ (NSArray *)incorrectPaymentProducts
{
    PUItem *productOne = [[PUItem alloc] init];
    productOne.name = @"Słuchawki";
    productOne.amount = @20.0;
    productOne.currency = @"PLN";
    
    PUItem *productTwo = [[PUItem alloc] init];
    productTwo.name = NSLocalizedString(@"Przesyłka kurierska", nil);
    productTwo.amount = @12.0;
    productTwo.currency = @"PLN";
    
    return @[productOne, productTwo];
}

+ (NSArray *)incorrectPaymentItems
{
    PUItem *toPay = [[PUItem alloc] init];
    toPay.name = NSLocalizedString(@"Do zapłaty", nil);
    toPay.amount = @32.0;
    toPay.currency = @"PLN";
    
    return @[toPay];
}

@end
