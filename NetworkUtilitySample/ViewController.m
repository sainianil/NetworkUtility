//
//  ViewController.m
//  NetworkUtilitySample
//
//  Created by Anil Saini on 11/17/15.
//  Copyright © 2015. All rights reserved.
//

#import "ViewController.h"
#import <NetworkUtility/NetworkUtility.h>

@interface ViewController() <NetworkStatusDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[NetworkStatusManager sharedNetworkStatusManager] setDelegate:self];
    // Do any additional setup after loading the view.
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

#pragma mark - NetworkUtility

- (void)networkStatusChanged
{
    NSString *msgText = @"No Network";
    NSString *infoText = @"Please check your network connection!";
    NSAlert *alert = [[NSAlert alloc] init];
    alert.alertStyle = NSCriticalAlertStyle;
    if ([[NetworkStatusManager sharedNetworkStatusManager] isNetworkAvailable])
    {
        alert.alertStyle = NSInformationalAlertStyle;
        infoText = @"Network is available.";
        msgText = @"Network available";
    }
   
    alert.informativeText = infoText;
    alert.messageText = msgText;
    [alert runModal];
}

@end
