//
//  GeneralHelper.h
//  AppDrvnNewsApp
//
//  Created by KY Tang on 9/27/17.
//  Copyright © 2017 AppDrvn PLT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface GeneralHelper : NSObject

#pragma mark - View Title
+ (UILabel *) setNavTitle:(NSString *)title withNavItem:(UINavigationItem *)navItem;

#pragma mark - Open Safari
+ (void) openBrowserInUrl:(NSString *)urlString;

#pragma mark - Show Alert Message
+ (void)showAlertMsg:(NSString *)msg;

@end
