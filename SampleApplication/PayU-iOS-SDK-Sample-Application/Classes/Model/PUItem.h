//
//  PUItem.h
//  SDK-Sample-Application
//
//  Created by Kamil Tustanowski on 29.04.2014.
//  Copyright (c) 2014 PayU S.A. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PUItem : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic) NSNumber *amount;
@property (nonatomic, copy) NSString *currency;

@end
