//
//  ReadsDetailHeaderView.h
//  AppDrvnNewsApp
//
//  Created by Tang Kean Yong on 1/7/18.
//  Copyright © 2018 KyTang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewsModel.h"

@interface ReadsDetailHeaderView : UIView

@property id delegate;
@property (strong, nonatomic) IBOutlet UIView *view;

- (void) updateDisplay:(NewsModel *)model;

@end

@protocol ReadsDetailHeaderViewDelegate <NSObject>

- (void) ReadsDetailHeaderViewDelegateUpdateHeight:(CGFloat)height;
- (void) ReadsDetailHeaderViewDelegateDidSelectedAtIndex:(NSInteger)index;

@end
