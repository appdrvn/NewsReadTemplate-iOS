//
//  RelatedVideoTableViewCell.h
//  AppDrvnNewsApp
//
//  Created by Tang Kean Yong on 1/7/18.
//  Copyright © 2018 KyTang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewsModel.h"

@interface RelatedVideoTableViewCell : UITableViewCell

- (void) updateDisplay:(NewsModel *)model;

@end
