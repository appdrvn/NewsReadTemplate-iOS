//
//  VideoViewController.h
//  AppDrvnNewsApp
//
//  Created by Tang Kean Yong on 1/3/18.
//  Copyright © 2018 KyTang. All rights reserved.
//

#import "BaseTableViewController.h"
#import "NewsModel.h"

@interface VideoViewController : BaseTableViewController

@property id delegate;

@end

@protocol VideoViewControllerDelegate <NSObject>

- (void) VideoViewControllerDelegateDidClickOn:(NewsModel *)newsModel;

@end
