//
//  NetworkStatusManager.h
//  NetworkUtility
//
//  Created by Anil Saini on 5/4/15.
//  Copyright (c) 2015. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol NetworkStatusDelegate <NSObject>

- (void)networkStatusChanged;

@end

@interface NetworkStatusManager : NSObject
{
    __unsafe_unretained id <NetworkStatusDelegate> delegate;
}
@property(assign) id <NetworkStatusDelegate> delegate;

/*
 * This method returns a singleton object.
 */
+(id)sharedNetworkStatusManager;

/*
 * This method returns network rechability status of the system.
 */
- (BOOL)isNetworkAvailable;

@end
