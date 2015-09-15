//
//  PUPaymentViewController.m
//  SDK-Sample-Application
//
//  Created by Kamil Tustanowski on 28.04.2014.
//  Copyright (c) 2014 PayU S.A. All rights reserved.
//

#import "PUPaymentViewController.h"
#import "EXTScope.h"
#import "PUPaymentMethodDescription.h"
#import "PUItem.h"
#import "PUPaymentDetailsCellConfigurator.h"
#import "UIAlertView+SimpleAlert.h"
#import "PUAppDelegate.h"
#import "PUMainViewController.h"

@interface PUPaymentViewController () <UIAlertViewDelegate, PUPaymentServiceDelegate>

@property (weak, nonatomic) IBOutlet UIView *widgetView;
@property (strong, nonatomic) IBOutlet UIButton *payButton;
@property (strong, nonatomic) PUPaymentService *paymentService;

@end

@implementation PUPaymentViewController

/* ========================================================================================== */
#pragma mark - SDK code samples
/* ========================================================================================== */

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (id)initWithCoder:(NSCoder *)decoder
{
    self =  [super initWithCoder:decoder];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleOpenURL:) name:@"PUApplicationOpenURLNotification" object:nil];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"Logout", nil)
                                                                              style:UIBarButtonItemStylePlain
                                                                             target:self
                                                                             action:@selector(logoutPressed:)];
}

#pragma mark - Service instantiation

- (PUPaymentService *)paymentService
{
    if (_paymentService) {
        return _paymentService;
    }
    _paymentService = [[PUPaymentService alloc] init];
    _paymentService.dataSource = [self authorizationDataSource];
    _paymentService.delegate = self;
    return _paymentService;
}

- (id <PUAuthorizationDataSource>)authorizationDataSource
{
    return (PUAppDelegate *)[UIApplication sharedApplication].delegate;
}

#pragma mark - Widget integration

- (void)showPaymentMethodWidget
{
    [self.widgetView addSubview:[self.paymentService paymentMethodWidgetWithFrame:self.widgetView.bounds]];
}

#pragma mark - Submit payment

- (IBAction)submitPayment
{
    [self setPayButtonEnabled:NO];
    
    PUPaymentRequest *paymentRequest = [self preparePaymentRequest];
    @weakify(self);
    [self.paymentService submitPaymentRequest:paymentRequest
                            completionHandler:^(PUPaymentRequestStatus status, NSError *error) {
                                @strongify(self);
                                [self handleCompletion:status error:error];
                            }];
}

- (void)handleCompletion:(PUPaymentRequestStatus)status error:(NSError *)error
{
    switch (status) {
        case PUPaymentRequestStatusSuccess:
            [UIAlertView showAlertWithMessage:NSLocalizedString(@"Płatność przyjęta do realizacji", nil)
                                  buttonTitle:nil
                                  andDelegate:self];
            [self setPayButtonEnabled:YES];
            break;
            
        case PUPaymentRequestStatusRetry:
            NSLog(@"User whant to change payment method: %@", error);
            [self setPayButtonEnabled:YES];
            break;
            
        case PUPaymentRequestStatusFailure:
            NSLog(@"Error submitting payment: %@", error);
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:nil
                                                                message:NSLocalizedString(@"Płatność nieudana", nil)
                                                               delegate:self
                                                      cancelButtonTitle:NSLocalizedString(@"Zamknij", nil)
                                                      otherButtonTitles:nil];
            [alertView show];
            [self setPayButtonEnabled:YES];
            break;
    }
}

#pragma mark - Create Payment Request object

- (PUPaymentRequest *)preparePaymentRequest
{
    NSString *paymentMethodsKey = NSLocalizedString(@"Płatność", nil);
    
    NSArray *paymentItems = self.content[paymentMethodsKey];
    PUItem *item = [paymentItems lastObject];
    
    PUPaymentRequest *paymentRequest = [[PUPaymentRequest alloc] init];
    paymentRequest.extOrderId = [NSString stringWithFormat:@"%u",arc4random()];
    paymentRequest.paymentDescription = NSLocalizedString(@"Płatność od merchanta testowego", nil);
    paymentRequest.amount = [NSDecimalNumber decimalNumberWithMantissa:[item.amount unsignedLongLongValue] exponent:0 isNegative:NO];
    paymentRequest.currency = @"PLN";
    paymentRequest.notifyURL = [NSURL URLWithString:[@"https://myserver.mydomain.com/notify/" stringByAppendingString:paymentRequest.extOrderId]];
    
    return paymentRequest;
}

#pragma mark - Payment Service Delegate

- (void)paymentServiceDidRequestPresentingViewController:(UIViewController *)viewController
{
    [self.navigationController presentViewController:viewController animated:YES completion:nil];
}

- (void)paymentServiceDidSelectPaymentMethod:(PUPaymentMethodDescription *)paymentMethod
{
    BOOL hasPaymentMethod = paymentMethod != nil;
    self.payButton.enabled = hasPaymentMethod;
}

#pragma mark - handle UIApplication openURL
- (void)handleOpenURL:(NSNotification *)notification
{
    NSURL *url = notification.userInfo[UIApplicationLaunchOptionsURLKey];
    [self.paymentService handleOpenURL:url];
}

#pragma mark - Logout user from merchant application
- (void)logoutPressed:(id)sender
{
    [self.paymentService clearUserContext];
}

/* ========================================================================================== */
#pragma mark - View controller lifecycle & helper methods
/* ========================================================================================== */

#pragma mark - Helper methods

- (void)setPayButtonEnabled:(BOOL)enabled
{
    self.payButton.enabled = enabled;
}

- (void)refreshPaymentMethodWith:(PUPaymentMethodDescription *)paymentMethod
{
    NSString *paymentKey = NSLocalizedString(@"Płatność", nil);
    NSMutableDictionary *content = [self.content mutableCopy];
    NSMutableArray *paymentArray = [self.content[paymentKey] mutableCopy];
    
    paymentArray[0] = paymentMethod ? paymentMethod : [[PUPaymentMethodDescription alloc] init];
    
    content[paymentKey] = [paymentArray copy];
    self.content = content;
    
    [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:1]
                  withRowAnimation:UITableViewRowAnimationNone];
}


#pragma  mark - View controller lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self showPaymentMethodWidget];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (NSString *)title
{
    return NSLocalizedString(@"Płatność", nil);
}

#pragma mark - Table view data source

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    id content = [self itemForIndexPath:indexPath];
    
    return [PUPaymentDetailsCellConfigurator configureCellForTable:tableView withContent:content];
}

@end
