//
//  ReadsDetailHeaderView.m
//  AppDrvnNewsApp
//
//  Created by Tang Kean Yong on 1/7/18.
//  Copyright © 2018 KyTang. All rights reserved.
//

#import "ReadsDetailHeaderView.h"
#import "AppConstants.h"
#import "LCBannerView.h"
#import "NSDate+NVTimeAgo.h"

@interface ReadsDetailHeaderView()<LCBannerViewDelegate, UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UIView *bannerBgView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *countryLabel;
@property (weak, nonatomic) IBOutlet UIWebView *contentWebView;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bannerViewHeightConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *contentWebViewHeightConstraint;

@end

@implementation ReadsDetailHeaderView

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
    [self.view setNeedsLayout];
    [self.view layoutIfNeeded];
    
    self.bannerBgView.backgroundColor = [UIColor clearColor];
    self.titleLabel.backgroundColor = [UIColor clearColor];
    self.timeLabel.backgroundColor = [UIColor clearColor];
    self.countryLabel.backgroundColor = [UIColor clearColor];
    
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    self.titleLabel.preferredMaxLayoutWidth = screenRect.size.width - 40;
}

- (void) updateDisplay:(NewsModel *)model
{
    self.bannerViewHeightConstraint.constant = BANNER_VIEW_HEIGHT;
    
    LCBannerView *bannerView = [LCBannerView bannerViewWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, BANNER_VIEW_HEIGHT)
                                                        delegate:self
                                                       imageURLs:model.images
                                                placeholderImage:@"placeholder.png"
                                                   timerInterval:4.0f
                                   currentPageIndicatorTintColor:[UIColor clearColor]
                                          pageIndicatorTintColor:[UIColor clearColor]];
    bannerView.backgroundColor = [UIColor whiteColor];
    [self.bannerBgView addSubview:bannerView];
    
    self.titleLabel.text = [NSString stringWithFormat:@"%@", model.title];
    self.countryLabel.text = [NSString stringWithFormat:@"%@", model.country];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd MMM yyyy HH':'mm"];
    NSDate *serverDate = [dateFormatter dateFromString:model.datetime];
    self.timeLabel.text = [NSString stringWithFormat:@"%@", [serverDate formattedAsTimeAgo]];
    
    self.contentWebView.userInteractionEnabled = NO;
    self.contentWebView.backgroundColor = [UIColor clearColor];
    self.contentWebView.delegate = self;
    
    NSString *htmlString = [NSString stringWithFormat:@"<html><body>%@</body></html>", model.htmlContent];
    [self.contentWebView loadHTMLString:htmlString baseURL:nil];
}

#pragma mark - LCBannerViewDelegate
- (void)bannerView:(LCBannerView *)bannerView didClickedImageIndex:(NSInteger)index
{
    if ([self.delegate respondsToSelector:@selector(ReadsDetailHeaderViewDelegateDidSelectedAtIndex:)])
    {
        [self.delegate ReadsDetailHeaderViewDelegateDidSelectedAtIndex:index];
    }
}

#pragma mark - UIWebView Delegate
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    // Disable user selection
    [webView stringByEvaluatingJavaScriptFromString:@"document.documentElement.style.webkitUserSelect='none';document.body.style.margin='0';document.body.style.padding = '0';"];
    
    NSString *result = [webView stringByEvaluatingJavaScriptFromString:@"document.body.offsetHeight;"];
    self.contentWebViewHeightConstraint.constant = [result floatValue];
    if ([self.delegate respondsToSelector:@selector(ReadsDetailHeaderViewDelegateUpdateHeight:)])
    {
        [self.delegate ReadsDetailHeaderViewDelegateUpdateHeight:[result floatValue] + 57 + self.titleLabel.frame.size.height + BANNER_VIEW_HEIGHT];
    }
}

@end
