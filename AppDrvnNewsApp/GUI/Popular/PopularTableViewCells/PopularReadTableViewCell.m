//
//  PopularReadTableViewCell.m
//  AppDrvnNewsApp
//
//  Created by Tang Kean Yong on 1/5/18.
//  Copyright © 2018 KyTang. All rights reserved.
//

#import "PopularReadTableViewCell.h"
#import "NSDate+NVTimeAgo.h"
#import "UIImageView+WebCache.h"

@interface PopularReadTableViewCell()

@property (weak, nonatomic) IBOutlet UILabel *numberLabel;
@property (weak, nonatomic) IBOutlet UIImageView *thumbnailImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *countryLabel;
@property (weak, nonatomic) IBOutlet UIView *bgView;

@end

@implementation PopularReadTableViewCell

- (void) layoutSubviews
{
    [super layoutSubviews];
    self.titleLabel.backgroundColor = [UIColor clearColor];
    self.timeLabel.backgroundColor = [UIColor clearColor];
    self.countryLabel.backgroundColor = [UIColor clearColor];
    self.bgView.backgroundColor = [UIColor whiteColor];
}

- (void) updateDisplay:(NewsModel *)model
{
    self.numberLabel.text = [NSString stringWithFormat:@"%lu", self.currentIndex];
    self.numberLabel.hidden = self.hideNumbering;
    
    [self.thumbnailImageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@", [model.images firstObject]]] placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
    self.titleLabel.text = [NSString stringWithFormat:@"%@", model.title];
    self.countryLabel.text = [NSString stringWithFormat:@"%@", model.country];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd MMM yyyy HH':'mm"];
    NSDate *serverDate = [dateFormatter dateFromString:model.datetime];
    self.timeLabel.text = [NSString stringWithFormat:@"%@", [serverDate formattedAsTimeAgo]];
}

@end
