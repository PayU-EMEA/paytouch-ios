//
//  PUContentTableViewController.m
//  SDK-Sample-Application
//
//  Created by Kamil Tustanowski on 28.04.2014.
//  Copyright (c) 2014 PayU S.A. All rights reserved.
//

#import "PUContentTableViewController.h"

@implementation PUContentTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self setup];
}

- (void)setup
{
    self.clearsSelectionOnViewWillAppear = YES;
    self.tableView.accessibilityIdentifier = @"contentTable";
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [[self.content allKeys] count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray *rows = [self itemsForSectionIndex:section];
    return [rows count];
}

- (NSArray *)itemsForSectionIndex:(NSInteger)sectionIndex
{
    NSString *sectionName = [self.content allKeys][sectionIndex];
    NSArray *rows = self.content[sectionName];
    return rows;
}

- (id)itemForIndexPath:(NSIndexPath *)indexPath
{
    NSArray *items = [self itemsForSectionIndex:indexPath.section];
    return items[indexPath.row];
}

#pragma mark - Table view delegate

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [self.content allKeys][section];
}

@end
