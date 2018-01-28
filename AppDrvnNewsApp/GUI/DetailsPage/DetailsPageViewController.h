//
//  DetailsPageViewController.h
//  AppDrvnNewsApp
//
//  Created by Tang Kean Yong on 1/7/18.
//  Copyright © 2018 KyTang. All rights reserved.
//

#import "BaseViewController.h"
#import "NewsModel.h"

@interface DetailsPageViewController : BaseViewController

@property (nonatomic, strong) NSString *titleString;
@property (nonatomic, strong) NewsModel *selectedNewsModel;

@end
