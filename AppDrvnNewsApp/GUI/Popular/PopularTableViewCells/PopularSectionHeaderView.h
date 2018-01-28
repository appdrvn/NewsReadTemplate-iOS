//
//  PopularSectionHeaderView.h
//  AppDrvnNewsApp
//
//  Created by Tang Kean Yong on 1/5/18.
//  Copyright © 2018 KyTang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PopularSectionHeaderView : UIView

@property (strong, nonatomic) IBOutlet UIView *view;

- (void) updateDisplay:(NSString *)sectionTitle;

@end
