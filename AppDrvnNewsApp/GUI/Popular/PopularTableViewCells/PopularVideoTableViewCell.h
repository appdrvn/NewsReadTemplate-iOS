//
//  PopularVideoTableViewCell.h
//  AppDrvnNewsApp
//
//  Created by Tang Kean Yong on 1/5/18.
//  Copyright © 2018 KyTang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewsModel.h"

@interface PopularVideoTableViewCell : UITableViewCell

@property (nonatomic) NSInteger currentIndex;
@property (nonatomic) BOOL hideNumbering;

- (void) updateDisplay:(NewsModel *)model;

@end
