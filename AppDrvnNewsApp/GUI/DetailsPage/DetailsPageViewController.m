//
//  DetailsPageViewController.m
//  AppDrvnNewsApp
//
//  Created by Tang Kean Yong on 1/7/18.
//  Copyright © 2018 KyTang. All rights reserved.
//

#import "DetailsPageViewController.h"
#import "ReadsDetailHeaderView.h"
#import "VideosDetailHeaderView.h"
#import "DetailsRelatedSectionHeaderView.h"
#import "RelatedReadsTableViewCell.h"
#import "RelatedVideoTableViewCell.h"
#import "MWPhotoBrowser.h"

@interface DetailsPageViewController ()<ReadsDetailHeaderViewDelegate, VideosDetailHeaderViewDelegate, UITableViewDataSource, UITableViewDelegate, MWPhotoBrowserDelegate>

@property (weak, nonatomic) IBOutlet UITableView *detailTableView;
@property (nonatomic, strong) ReadsDetailHeaderView *readsDetailHeaderView;
@property (nonatomic, strong) VideosDetailHeaderView *videosDetailHeaderView;
@property (strong, nonatomic) NSMutableArray *imageViewerArray; // MWPhotoBrowser

@end

@implementation DetailsPageViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.titleView = [GeneralHelper setNavTitle:self.titleString withNavItem:self.navigationItem];

    if (self.selectedNewsModel.type == NewsTypesVideo)
    {
        [self addVideoHeaderView];
        self.detailTableView.backgroundColor = [UIColor videoBgColor];
        self.view.backgroundColor = [UIColor videoBgColor];
    }
    else
    {
        [self addHeaderView];
        self.detailTableView.backgroundColor = [UIColor whiteColor];
        self.view.backgroundColor = [UIColor whiteColor];
    }
}

#pragma mark - Add Header View - Videos
- (void) addVideoHeaderView
{
    self.videosDetailHeaderView = nil;
    self.videosDetailHeaderView = [[VideosDetailHeaderView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 320.0f)];
    self.videosDetailHeaderView.backgroundColor = [UIColor clearColor];
    self.videosDetailHeaderView.view.backgroundColor = [UIColor clearColor];
    self.videosDetailHeaderView.delegate = self;
    [self.videosDetailHeaderView updateDisplay:self.selectedNewsModel];
    [self.videosDetailHeaderView setNeedsLayout];
    [self.videosDetailHeaderView layoutIfNeeded];
    [self.videosDetailHeaderView layoutSubviews];
    
    CGRect headerFrame = self.videosDetailHeaderView.frame;
    headerFrame.size.height = [self.videosDetailHeaderView systemLayoutSizeFittingSize:UILayoutFittingExpandedSize].height;
    self.videosDetailHeaderView.frame = headerFrame;
    
    self.detailTableView.tableHeaderView = self.videosDetailHeaderView;
}

#pragma mark - VideosDetailHeaderViewDelegate
- (void) VideosDetailHeaderViewDelegateUpdateHeight:(CGFloat)height
{
    CGRect headerFrame = self.videosDetailHeaderView.frame;
    headerFrame.size.height = height;
    self.videosDetailHeaderView.frame = headerFrame;
    
    self.detailTableView.tableHeaderView = self.videosDetailHeaderView;
}

- (void) VideosDetailHeaderViewDelegateDidSelectedAtIndex:(NSInteger)index
{
    // Open Image Viewer
    self.imageViewerArray = [NSMutableArray new];
    
    for (int i=0; i<[self.selectedNewsModel.images count]; i++)
    {
        MWPhoto *p = [MWPhoto photoWithURL:[NSURL URLWithString:self.selectedNewsModel.images[i]]];
        [self.imageViewerArray addObject:p];
    }
    [self performPhotoSelectionAction:index];
}

#pragma mark - Add Header View - Reads
- (void) addHeaderView
{
    self.readsDetailHeaderView = nil;
    self.readsDetailHeaderView = [[ReadsDetailHeaderView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 320.0f)];
    self.readsDetailHeaderView.backgroundColor = [UIColor clearColor];
    self.readsDetailHeaderView.view.backgroundColor = [UIColor clearColor];
    self.readsDetailHeaderView.delegate = self;
    [self.readsDetailHeaderView updateDisplay:self.selectedNewsModel];
    [self.readsDetailHeaderView setNeedsLayout];
    [self.readsDetailHeaderView layoutIfNeeded];
    [self.readsDetailHeaderView layoutSubviews];
    
    CGRect headerFrame = self.readsDetailHeaderView.frame;
    headerFrame.size.height = [self.readsDetailHeaderView systemLayoutSizeFittingSize:UILayoutFittingExpandedSize].height;
    self.readsDetailHeaderView.frame = headerFrame;
    
    self.detailTableView.tableHeaderView = self.readsDetailHeaderView;
}

#pragma mark - ReadsDetailHeaderViewDelegate
- (void) ReadsDetailHeaderViewDelegateUpdateHeight:(CGFloat)height
{
    CGRect headerFrame = self.readsDetailHeaderView.frame;
    headerFrame.size.height = height;
    self.readsDetailHeaderView.frame = headerFrame;
    
    self.detailTableView.tableHeaderView = self.readsDetailHeaderView;
}

- (void) ReadsDetailHeaderViewDelegateDidSelectedAtIndex:(NSInteger)index
{
    // Open Image Viewer
    self.imageViewerArray = [NSMutableArray new];
    
    for (int i=0; i<[self.selectedNewsModel.images count]; i++)
    {
        MWPhoto *p = [MWPhoto photoWithURL:[NSURL URLWithString:self.selectedNewsModel.images[i]]];
        [self.imageViewerArray addObject:p];
    }
    [self performPhotoSelectionAction:index];
}

#pragma mark - MWPhotoBrowserDelegate
- (void)performPhotoSelectionAction:(NSInteger)initialIndex
{
    MWPhotoBrowser * browser = [[MWPhotoBrowser alloc] initWithDelegate:self];
    [browser setCurrentPhotoIndex:initialIndex];
    browser.displayActionButton = YES;
    browser.zoomSmallPhotos = YES;
    
    UINavigationController * nc = [[UINavigationController alloc] initWithRootViewController:browser];
    nc.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:nc animated:YES completion:nil];
}

- (NSUInteger)numberOfPhotosInPhotoBrowser:(MWPhotoBrowser *)photoBrowser
{
    return [self.imageViewerArray count];
}

- (id<MWPhoto>)photoBrowser:(MWPhotoBrowser *)photoBrowser photoAtIndex:(NSUInteger)index
{
    if (index < [self.imageViewerArray count])
        return [self.imageViewerArray objectAtIndex:index];
    
    return nil;
}

#pragma mark - UIButtons Actions
- (IBAction)backPressed:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)sharePressed:(id)sender
{
    NSURL *myWebsite = [NSURL URLWithString:[NSString stringWithFormat:@"%@", self.selectedNewsModel.shareUrl]];
    
    NSArray *objectsToShare = @[myWebsite];
    
    UIActivityViewController *activityVC = [[UIActivityViewController alloc] initWithActivityItems:objectsToShare applicationActivities:nil];
    
    [self presentViewController:activityVC animated:YES completion:nil];
}

#pragma mark - UITableView Delegate
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if ([self.selectedNewsModel.relateds count] > 0)
    {
        return 51.0f;
    }
    
    return 0.0f;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    DetailsRelatedSectionHeaderView *sectionHeader = [[DetailsRelatedSectionHeaderView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 51.0f)];
    sectionHeader.backgroundColor = [UIColor whiteColor];
    [sectionHeader updateDisplay:@"Related"];
    
    return sectionHeader;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 96;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.selectedNewsModel.relateds count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    RelatedReadsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([RelatedReadsTableViewCell class])];
    NewsModel *news = (NewsModel *)self.selectedNewsModel.relateds[indexPath.row];
    switch (news.type)
    {
        case NewsTypesRead:
        {
            RelatedReadsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([RelatedReadsTableViewCell class])];
            cell.backgroundColor = [UIColor whiteColor];
            [cell updateDisplay:news];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            
            return cell;
        }
            break;
            
        case NewsTypesVideo:
        {
            RelatedVideoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([RelatedVideoTableViewCell class])];
            cell.backgroundColor = [UIColor clearColor];
            [cell updateDisplay:news];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            
            return cell;
        }
            break;
            
        default:
            break;
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DetailsPageViewController *infoController = [self.storyboard instantiateViewControllerWithIdentifier:@"DetailsPageViewController"];
    infoController.titleString = self.titleString;
    infoController.selectedNewsModel = self.selectedNewsModel.relateds[indexPath.row];
    
    [self.navigationController pushViewController:infoController animated:YES];
}

@end
