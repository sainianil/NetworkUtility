//
//  NetworkStatusManager.m
//  NetworkUtility
//
//  Created by Anil Saini on 5/4/15.
//  Copyright (c) 2015. All rights reserved.
//

#import "NetworkStatusManager.h"
#import "Reachability.h"


static NetworkStatusManager *networkStatusManager;

@interface NetworkStatusManager()
{
    Reachability* internetReachable;
    BOOL isNetworkAvailable;
}

@end

@implementation NetworkStatusManager
@synthesize delegate;

+ (id)sharedNetworkStatusManager
{
    if(!networkStatusManager){
        networkStatusManager = [[NetworkStatusManager alloc] init];
    }
    
    return networkStatusManager;
}

- (instancetype)init
{
    if (self = [super init])
    {
        //Create networkStatusChanged observer, it will trigger when network status changes from on to off or vice versa
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(networkStatusChanged:) name:kReachabilityChangedNotification object:nil];
        
        internetReachable = [Reachability reachabilityForInternetConnection];
        //Start notifier and check the status
        [internetReachable startNotifier];
        [self updateInterfaceWithReachability:internetReachable];
    }
    return self;
}

- (void) networkStatusChanged:(NSNotification *)notif
{
    Reachability* curReach = [notif object];
    NSParameterAssert([curReach isKindOfClass:[Reachability class]]);
    [self updateInterfaceWithReachability:curReach];
    [delegate networkStatusChanged];
}

- (void)updateInterfaceWithReachability:(Reachability *)reachability
{
    NetworkStatus internetStatus = [internetReachable currentReachabilityStatus];
    
    switch (internetStatus)
    {
        case NotReachable:
        {
            isNetworkAvailable=NO;
            break;
        }
        case ReachableViaWiFi:
        {
            isNetworkAvailable=YES;
            break;
        }
        case ReachableViaWWAN:
        {
            isNetworkAvailable=YES;
            break;
        }
    }
}

- (BOOL)isNetworkAvailable
{
    return isNetworkAvailable;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kReachabilityChangedNotification object:nil];
}

@end
