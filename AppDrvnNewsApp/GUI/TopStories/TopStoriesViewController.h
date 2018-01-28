//
//  TopStoriesViewController.h
//  AppDrvnNewsApp
//
//  Created by Tang Kean Yong on 1/3/18.
//  Copyright © 2018 KyTang. All rights reserved.
//

#import "BaseTableViewController.h"
#import "NewsModel.h"

@interface TopStoriesViewController : BaseTableViewController

@property id delegate;

@end

@protocol TopStoriesViewControllerDelegate <NSObject>

- (void) TopStoriesViewControllerDelegateDidClickOn:(NewsModel *)newsModel;

@end