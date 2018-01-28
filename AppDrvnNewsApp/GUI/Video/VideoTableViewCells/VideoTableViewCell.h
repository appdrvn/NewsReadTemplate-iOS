//
//  VideoTableViewCell.h
//  AppDrvnNewsApp
//
//  Created by Tang Kean Yong on 1/6/18.
//  Copyright © 2018 KyTang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewsModel.h"

@interface VideoTableViewCell : UITableViewCell

- (void) updateDisplay:(NewsModel *)model;

@end
