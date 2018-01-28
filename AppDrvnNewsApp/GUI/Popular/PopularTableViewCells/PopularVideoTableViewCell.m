//
//  PopularVideoTableViewCell.m
//  AppDrvnNewsApp
//
//  Created by Tang Kean Yong on 1/5/18.
//  Copyright © 2018 KyTang. All rights reserved.
//

#import "PopularVideoTableViewCell.h"
#import "UIImageView+WebCache.h"
#import "AppConstants.h"
#import "NSDate+NVTimeAgo.h"

@interface PopularVideoTableViewCell()

@property (weak, nonatomic) IBOutlet UILabel *numberLabel;
@property (weak, nonatomic) IBOutlet UIImageView *thumbnailImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *countryLabel;
@property (weak, nonatomic) IBOutlet UIView *bgView;
@property (weak, nonatomic) IBOutlet UILabel *durationLabel;

@end

@implementation PopularVideoTableViewCell

- (void) layoutSubviews
{
    [super layoutSubviews];
    self.titleLabel.backgroundColor = [UIColor clearColor];
    self.timeLabel.backgroundColor = [UIColor clearColor];
    self.countryLabel.backgroundColor = [UIColor clearColor];
    self.durationLabel.backgroundColor = [UIColor clearColor];
    self.bgView.backgroundColor = [UIColor videoBgColor];
}

- (void) updateDisplay:(NewsModel *)model
{
    self.numberLabel.text = [NSString stringWithFormat:@"%lu", self.currentIndex];
    self.numberLabel.hidden = self.hideNumbering;
    
    self.durationLabel.text = [NSString stringWithFormat:@"%@", model.videoDuration];
    [self.thumbnailImageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@", [model.images firstObject]]] placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
    self.titleLabel.text = [NSString stringWithFormat:@"%@", model.title];
    self.countryLabel.text = [NSString stringWithFormat:@"%@", model.country];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd MMM yyyy HH':'mm"];
    NSDate *serverDate = [dateFormatter dateFromString:model.datetime];
    self.timeLabel.text = [NSString stringWithFormat:@"%@", [serverDate formattedAsTimeAgo]];
}

@end
