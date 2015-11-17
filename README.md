# NetworkUtility
NetworkUtility framework notifies network status change.

#Following are the steps to use the NetworkUtility framework in your project.

1. Drag NetworkUtility framework to your project and make sure it copies to your app package (Check its added in Build phase-> Link Binaries With Libraries)
2. ```#import <NetworkUtility/NetworkUtility.h>``` file in your class where you want to be notified for network status.
3. Implement ```NetworkStatusDelegate``` protocal 
4. Set the network status delegate as ```[[NetworkStatusManager sharedNetworkStatusManager] setDelegate:self];```
5. Implement network delegate method: ```- (void)networkStatusChanged```
