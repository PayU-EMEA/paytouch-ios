//
//  PUThreeLabelCell+PUConfiguration.h
//  SDK-Sample-Application
//
//  Created by Kamil Tustanowski on 29.04.2014.
//  Copyright (c) 2014 PayU S.A. All rights reserved.
//

#import "PUThreeLabelCell.h"
@class PUItem;

@interface PUThreeLabelCell (PUConfiguration)

- (void)clean;
- (void)configureWithItem:(PUItem *)item;

@end
