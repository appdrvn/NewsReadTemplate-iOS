//
//  ReadCollectionViewCell.h
//  AppDrvnNewsApp
//
//  Created by Tang Kean Yong on 1/6/18.
//  Copyright © 2018 KyTang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewsModel.h"

@interface ReadCollectionViewCell : UICollectionViewCell

- (void) updateDisplay:(NewsModel *)model;

@end
