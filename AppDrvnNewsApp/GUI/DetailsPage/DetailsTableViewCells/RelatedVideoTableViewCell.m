//
//  RelatedVideoTableViewCell.m
//  AppDrvnNewsApp
//
//  Created by Tang Kean Yong on 1/7/18.
//  Copyright © 2018 KyTang. All rights reserved.
//

#import "RelatedVideoTableViewCell.h"
#import "UIImageView+WebCache.h"

@interface RelatedVideoTableViewCell()

@property (weak, nonatomic) IBOutlet UIImageView *thumbnailImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *durationLabel;

@end

@implementation RelatedVideoTableViewCell

- (void) layoutSubviews
{
    [super layoutSubviews];
    self.titleLabel.backgroundColor = [UIColor clearColor];
    self.timeLabel.backgroundColor = [UIColor clearColor];
    self.durationLabel.backgroundColor = [UIColor clearColor];
}

- (void) updateDisplay:(NewsModel *)model
{
    [self.thumbnailImageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@", [model.images firstObject]]] placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
    
    self.titleLabel.text = [NSString stringWithFormat:@"%@", model.title];
    
    self.durationLabel.text = [NSString stringWithFormat:@"%@", model.videoDuration];
}


@end
