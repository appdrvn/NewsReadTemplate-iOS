//
//  EntertainmentViewController.h
//  AppDrvnNewsApp
//
//  Created by Tang Kean Yong on 1/3/18.
//  Copyright © 2018 KyTang. All rights reserved.
//

#import "BaseTableViewController.h"
#import "NewsModel.h"

@interface EntertainmentViewController : BaseTableViewController

@property id delegate;

@end

@protocol EntertainmentViewControllerDelegate <NSObject>

- (void) EntertainmentViewControllerDelegateDidClickOn:(NewsModel *)newsModel;

@end
