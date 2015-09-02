//
//  PUPaymentDetailsCellConfigurator.m
//  PayU-SDK-Sample-Application
//
//  Created by Kamil Tustanowski on 08.05.2014.
//  Copyright (c) 2014 PayU. All rights reserved.
//

#import "PUPaymentDetailsCellConfigurator.h"
#import "PUPaymentMethodDescription.h"
#import "PUItem.h"
#import "PUThreeLabelCell+PUConfiguration.h"

@implementation PUPaymentDetailsCellConfigurator

+ (UITableViewCell *)configureCellForTable:(UITableView *)tableView withContent:(id)content
{
    static NSString *cellId = @"PUItemCellId";
    PUThreeLabelCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    [cell configureWithItem:content];
    
    return cell;
}

@end
