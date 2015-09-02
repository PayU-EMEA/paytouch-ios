//
//  PUSampleDataProvider.h
//  PayU-SDK-Sample-Application
//
//  Created by Kamil Tustanowski on 30.04.2014.
//  Copyright (c) 2014 PayU. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PUSampleDataProvider : NSObject

+ (NSDictionary *)samplePayments;

+ (NSDictionary *)sampleCorrectPayment;
+ (NSDictionary *)sampleIncorrectPayment;

@end
