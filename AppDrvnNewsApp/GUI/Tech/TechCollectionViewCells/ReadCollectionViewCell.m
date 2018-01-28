//
//  ReadCollectionViewCell.m
//  AppDrvnNewsApp
//
//  Created by Tang Kean Yong on 1/6/18.
//  Copyright © 2018 KyTang. All rights reserved.
//

#import "ReadCollectionViewCell.h"
#import "UIImageView+WebCache.h"
#import "NSDate+NVTimeAgo.h"

@interface ReadCollectionViewCell()

@property (weak, nonatomic) IBOutlet UIImageView *thumbnailImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

@end

@implementation ReadCollectionViewCell

- (void) layoutSubviews
{
    [super layoutSubviews];
    self.titleLabel.backgroundColor = [UIColor clearColor];
    self.timeLabel.backgroundColor = [UIColor clearColor];
}

- (void) updateDisplay:(NewsModel *)model
{
    [self.thumbnailImageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@", [model.images firstObject]]] placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
    
    self.titleLabel.text = [NSString stringWithFormat:@"%@", model.title];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd MMM yyyy HH':'mm"];
    NSDate *serverDate = [dateFormatter dateFromString:model.datetime];
    self.timeLabel.text = [NSString stringWithFormat:@"%@", [serverDate formattedAsTimeAgo]];
}

@end
