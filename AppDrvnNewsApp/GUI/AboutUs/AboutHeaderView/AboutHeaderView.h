//
//  AboutHeaderView.m
//  AppDrvnNewsApp
//
//  Created by Tang Kean Yong on 1/16/18.
//  Copyright © 2018 KyTang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AboutHeaderView : UIView

@property id delegate;
@property (strong, nonatomic) IBOutlet UIView *view;
- (void) updateDisplay:(NSString *)content;

@end

@protocol AboutHeaderViewDelegate <NSObject>

- (void) AboutHeaderViewDelegateDidClickOnFacebookButton;
- (void) AboutHeaderViewDelegateDidClickOnMailButton;
- (void) AboutHeaderViewDelegateDidClickOnWebsiteButton;

@end