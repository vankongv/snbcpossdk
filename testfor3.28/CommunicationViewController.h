//
//  CommunicationViewController.h
//  testfor3.28
//
//  Created by yuelin on 2019/5/27.
//  Copyright © 2019 yuelin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "POSSDK.h"

@protocol SendHandleDelegate <NSObject>

- (void)sendHandleToRootViewController:(DEVICEHANDLE )handle isConnected:(BOOL)isConnected;

@end

@interface CommunicationViewController : UIViewController

@property (nonatomic) DEVICEHANDLE handle;
@property (nonatomic, assign) id<SendHandleDelegate> handleDelegate;

@end
