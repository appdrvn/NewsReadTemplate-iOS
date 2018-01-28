//
//  TopStoriesFirstSectionHeaderView.h
//  AppDrvnNewsApp
//
//  Created by Tang Kean Yong on 1/6/18.
//  Copyright © 2018 KyTang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewsModel.h"

@interface TopStoriesFirstSectionHeaderView : UIView

@property id delegate;
@property (weak, nonatomic) IBOutlet UIView *view;
- (void) updateDisplay:(NewsModel *)model;

@end

@protocol TopStoriesFirstSectionHeaderViewDelegate <NSObject>

- (void) TopStoriesFirstSectionHeaderViewDelegateDidClicked;

@end
