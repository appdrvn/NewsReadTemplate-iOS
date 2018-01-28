//
//  RelatedNewsTableViewCell.m
//  AppDrvnNewsApp
//
//  Created by Tang Kean Yong on 1/6/18.
//  Copyright © 2018 KyTang. All rights reserved.
//

#import "RelatedNewsTableViewCell.h"
#import "UIImageView+WebCache.h"

@interface RelatedNewsTableViewCell()

@property (weak, nonatomic) IBOutlet UIImageView *thumbnailImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIView *bgView;

@end

@implementation RelatedNewsTableViewCell

- (void) layoutSubviews
{
    [super layoutSubviews];
    self.bgView.backgroundColor = [UIColor whiteColor];
    self.titleLabel.backgroundColor = [UIColor clearColor];
}

- (void) updateDisplay:(NewsModel *)model
{
    [self.thumbnailImageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@", [model.images firstObject]]] placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
    
    self.titleLabel.text = [NSString stringWithFormat:@"%@", model.title];
}

@end
