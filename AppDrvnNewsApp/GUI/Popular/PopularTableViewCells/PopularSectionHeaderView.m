//
//  PopularSectionHeaderView.m
//  AppDrvnNewsApp
//
//  Created by Tang Kean Yong on 1/5/18.
//  Copyright © 2018 KyTang. All rights reserved.
//

#import "PopularSectionHeaderView.h"

@interface PopularSectionHeaderView()

@property (weak, nonatomic) IBOutlet UILabel *sectionTitleLabel;

@end

@implementation PopularSectionHeaderView

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
    self.sectionTitleLabel.backgroundColor = [UIColor clearColor];
}

- (void) updateDisplay:(NSString *)sectionTitle
{
    self.sectionTitleLabel.text = [NSString stringWithFormat:@"%@", sectionTitle];
}

@end
