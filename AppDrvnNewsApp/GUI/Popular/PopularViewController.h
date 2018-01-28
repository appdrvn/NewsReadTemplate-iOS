//
//  PopularViewController.h
//  AppDrvnNewsApp
//
//  Created by Tang Kean Yong on 1/3/18.
//  Copyright © 2018 KyTang. All rights reserved.
//

#import "BaseTableViewController.h"
#import "NewsModel.h"

@interface PopularViewController : BaseTableViewController

@property id delegate;

@end

@protocol PopularViewControllerDelegate <NSObject>

- (void) PopularViewControllerDelegateDidClickOn:(NewsModel *)newsModel;

@end
