//
//  PUMainViewController.m
//  SDK-Sample-Application
//
//  Created by Kamil Tustanowski on 28.04.2014.
//  Copyright (c) 2014 PayU S.A. All rights reserved.
//

#import "PUMainViewController.h"
#import "PUPaymentViewController.h"
#import "PUItem.h"
#import "PUPaymentMethodDescription.h"
#import "PUSampleDataProvider.h"


static NSString *const kSegueName = @"paymentSegue";

@interface PUContentTableViewController ()

- (NSArray *)itemsForSectionIndex:(NSInteger)sectionIndex;
- (id)itemForIndexPath:(NSIndexPath *)indexPath;

@end

@implementation PUMainViewController

- (NSString *)title
{
    return NSLocalizedString(@"Zakupy", nil);
}

#pragma mark - Table view content configration

- (NSDictionary *)content
{
    if (!_content) {
        _content = [PUSampleDataProvider samplePayments];
    }
    
    return _content;
}

#pragma mark - Table view datasource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"StandardContentCellId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    
    NSString *item = [self itemForIndexPath:indexPath];
    [self configureCell:cell withItem:item];
    
    return cell;
}

- (void)configureCell:(UITableViewCell *)cell withItem:(id)item
{
    cell.textLabel.text = nil;
    
    cell.textLabel.text = item;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.font = [UIFont systemFontOfSize:15.0];
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
    [self performSegueWithIdentifier:kSegueName sender:cell];
}

#pragma mark - Segue support
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:kSegueName]) {
        
        NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
        PUPaymentViewController *viewController = segue.destinationViewController;

        switch (indexPath.row) {
            case 0: {
                viewController.content = [PUSampleDataProvider sampleCorrectPayment];
            }
                break;
            case 1:
                viewController.content = [PUSampleDataProvider sampleIncorrectPayment];
                break;
        }
    }
}

@end
