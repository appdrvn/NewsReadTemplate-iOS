//
//  VideosDetailHeaderView.h
//  AppDrvnNewsApp
//
//  Created by Tang Kean Yong on 1/7/18.
//  Copyright © 2018 KyTang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewsModel.h"

@interface VideosDetailHeaderView : UIView

@property id delegate;
@property (strong, nonatomic) IBOutlet UIView *view;

- (void) updateDisplay:(NewsModel *)model;

@end

@protocol VideosDetailHeaderViewDelegate <NSObject>

- (void) VideosDetailHeaderViewDelegateUpdateHeight:(CGFloat)height;
- (void) VideosDetailHeaderViewDelegateDidSelectedAtIndex:(NSInteger)index;

@end