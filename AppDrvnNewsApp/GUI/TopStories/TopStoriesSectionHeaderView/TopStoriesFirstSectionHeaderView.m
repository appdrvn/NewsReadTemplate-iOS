//
//  TopStoriesFirstSectionHeaderView.m
//  AppDrvnNewsApp
//
//  Created by Tang Kean Yong on 1/6/18.
//  Copyright © 2018 KyTang. All rights reserved.
//

#import "TopStoriesFirstSectionHeaderView.h"
#import "UIImageView+WebCache.h"

@interface TopStoriesFirstSectionHeaderView()

@property (weak, nonatomic) IBOutlet UIView *bgView;
@property (weak, nonatomic) IBOutlet UIImageView *thumbnailImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *countryLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *durationLabel;
@property (weak, nonatomic) IBOutlet UIView *playView;

@end

@implementation TopStoriesFirstSectionHeaderView

- (id)initWithFrame:(CGRect)rect
{
    if (self = [super initWithFrame:rect])
    {
        [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil];
        [self addSubview:self.view];
        
        [self.view setTranslatesAutoresizingMaskIntoConstraints:NO];
        
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[view]|" options:0 metrics:nil views:@{@"view":self.view}]];
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[view]|" options:0 metrics:nil views:@{@"view":self.view}]];
    }
    return self;
}

- (void) layoutSubviews
{
    [super layoutSubviews];
    self.view.backgroundColor = [UIColor clearColor];
    self.bgView.backgroundColor = [UIColor whiteColor];
    self.titleLabel.backgroundColor = [UIColor clearColor];
    self.timeLabel.backgroundColor = [UIColor clearColor];
    self.countryLabel.backgroundColor = [UIColor clearColor];
    self.durationLabel.backgroundColor = [UIColor clearColor];
}

- (void) updateDisplay:(NewsModel *)model
{
    self.playView.hidden = NO;
    self.durationLabel.text = [NSString stringWithFormat:@"%@", model.videoDuration];
    if (model.type == NewsTypesRead)
    {
        self.playView.hidden = YES;
    }
    
    [self.thumbnailImageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@", [model.images firstObject]]] placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
    
    self.titleLabel.text = [NSString stringWithFormat:@"%@", model.title];
    self.timeLabel.text = [NSString stringWithFormat:@"%@", model.datetime];
    self.countryLabel.text = [NSString stringWithFormat:@"%@", model.country];
}

#pragma mark - UIButtons Actions
- (IBAction)buttonPressed:(id)sender
{
    if ([self.delegate respondsToSelector:@selector(TopStoriesFirstSectionHeaderViewDelegateDidClicked)])
    {
        [self.delegate TopStoriesFirstSectionHeaderViewDelegateDidClicked];
    }
}

@end
