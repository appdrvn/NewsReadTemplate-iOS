//
//  TechViewController.h
//  AppDrvnNewsApp
//
//  Created by Tang Kean Yong on 1/3/18.
//  Copyright © 2018 KyTang. All rights reserved.
//

#import "BaseCollectionViewController.h"
#import "NewsModel.h"

@interface TechViewController : BaseCollectionViewController

@property id delegate;

@end

@protocol TechViewControllerDelegate <NSObject>

- (void) TechViewControllerDelegateDelegateDidClickOn:(NewsModel *)newsModel;

@end
