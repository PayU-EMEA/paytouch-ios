//
//  PUThreeLabelCell+PUConfiguration.m
//  SDK-Sample-Application
//
//  Created by Kamil Tustanowski on 29.04.2014.
//  Copyright (c) 2014 PayU S.A. All rights reserved.
//

#import "PUThreeLabelCell+PUConfiguration.h"
#import "PUItem.h"

@implementation PUThreeLabelCell (PUConfiguration)

- (void)clean
{
    self.leftLabel.text = nil;
    self.rightLabel.text = nil;
    self.farRightLabel.text = nil;
}

- (void)configureWithItem:(PUItem *)item
{
    [self clean];
    
    self.leftLabel.text = item.name;
    self.rightLabel.text = [item.amount stringValue];
    self.farRightLabel.text = item.currency;    
}

@end
