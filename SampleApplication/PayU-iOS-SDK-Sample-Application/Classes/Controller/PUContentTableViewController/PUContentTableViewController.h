//
//  PUContentTableViewController.h
//  SDK-Sample-Application
//
//  Created by Kamil Tustanowski on 28.04.2014.
//  Copyright (c) 2014 PayU S.A. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PUContentTableViewController : UITableViewController {
    @protected
    NSDictionary *_content;
}

@property (nonatomic, strong) NSDictionary *content;

- (NSArray *)itemsForSectionIndex:(NSInteger)sectionIndex;
- (id)itemForIndexPath:(NSIndexPath *)indexPath;

@end
