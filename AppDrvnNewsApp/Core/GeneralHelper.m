//
//  GeneralHelper.m
//  AppDrvnNewsApp
//
//  Created by KY Tang on 9/27/17.
//  Copyright © 2017 AppDrvn PLT. All rights reserved.
//

#import "GeneralHelper.h"

@implementation GeneralHelper

#pragma mark - View Title
+ (UILabel *) setNavTitle:(NSString *)title withNavItem:(UINavigationItem *)navItem
{
    NSString *temp = title;
    if ([temp length] > 19)
    {
        NSRange range = [temp rangeOfComposedCharacterSequencesForRange:(NSRange){0, 19}];
        temp = [temp substringWithRange:range];
        temp = [temp stringByAppendingString:@"..."];
    }
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0,0, navItem.titleView.frame.size.width-20, 40)];
    label.text = [temp uppercaseString];
    label.textColor = [UIColor whiteColor];
    label.backgroundColor = [UIColor clearColor];
    label.adjustsFontSizeToFitWidth = YES;
    label.font = [UIFont boldSystemFontOfSize:14.0f];
    label.textAlignment = NSTextAlignmentCenter;
    
    return label;
}


#pragma mark - Open Safari
+ (void) openBrowserInUrl:(NSString *)urlString
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlString]];
}

#pragma mark - Show Alert Message
+ (void)showAlertMsg:(NSString *)msg
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:msg delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [alert show];
}


@end
