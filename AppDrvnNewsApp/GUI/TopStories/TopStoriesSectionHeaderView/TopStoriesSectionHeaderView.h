//
//  TopStoriesSectionHeaderView.h
//  AppDrvnNewsApp
//
//  Created by Tang Kean Yong on 1/6/18.
//  Copyright © 2018 KyTang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TopStoriesSectionHeaderView : UIView

@property (strong, nonatomic) IBOutlet UIView *view;
- (void) updateDisplay:(NSString *)title;

@end
