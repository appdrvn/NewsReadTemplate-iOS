//
//  MainPageViewController.m
//  AppDrvnNewsApp
//
//  Created by Tang Kean Yong on 1/3/18.
//  Copyright © 2018 KyTang. All rights reserved.
//

#import "MainPageViewController.h"
#import "CarbonKit.h"
#import "TopStoriesViewController.h"
#import "EntertainmentViewController.h"
#import "PopularViewController.h"
#import "TechViewController.h"
#import "VideoViewController.h"
#import "DetailsPageViewController.h"

@interface MainPageViewController ()<CarbonTabSwipeNavigationDelegate, TopStoriesViewControllerDelegate, EntertainmentViewControllerDelegate, PopularViewControllerDelegate, VideoViewControllerDelegate, TechViewControllerDelegate>
{
    NSArray *items;
    CarbonTabSwipeNavigation *carbonTabSwipeNavigation;
}

@property (nonatomic, strong) NSString *titleString;
@property (nonatomic, strong) NewsModel *selectedNewsModel;

@end

@implementation MainPageViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.titleView = [GeneralHelper setNavTitle:@"AppDrvn News" withNavItem:self.navigationItem];
    
    [self loadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UIButtons Actions
- (IBAction)sideMenuPressed:(id)sender
{
    [self performSegueWithIdentifier:@"gotoAboutUsVC" sender:self];
}

#pragma mark - Private
- (void) loadData
{
    items = @[@"Top Stories", @"Video", @"Popular", @"Tech", @"Entertainment"];
    
    
    [self style];
}

#pragma mark -
- (void) style
{
    carbonTabSwipeNavigation = [[CarbonTabSwipeNavigation alloc] initWithItems:items delegate:self];
    [carbonTabSwipeNavigation insertIntoRootViewController:self];
    carbonTabSwipeNavigation.carbonTabSwipeScrollView.backgroundColor = [UIColor darkGrayColor];
    carbonTabSwipeNavigation.toolbar.translucent = NO;
    carbonTabSwipeNavigation.toolbarHeight.constant = 35;
    carbonTabSwipeNavigation.toolbar.clipsToBounds = YES;
    carbonTabSwipeNavigation.carbonSegmentedControl.indicatorHeight = 35;
    [carbonTabSwipeNavigation setIndicatorColor:[UIColor whiteColor]];
    [carbonTabSwipeNavigation setTabExtraWidth:10];
    
    // Custimize segmented control
    UIFont *normalFont = [UIFont boldSystemFontOfSize:12.0f];
    [carbonTabSwipeNavigation setNormalColor:[UIColor whiteColor]
                                        font:normalFont];
    [carbonTabSwipeNavigation setSelectedColor:[UIColor appThemeColor]
                                          font:normalFont];
}

# pragma mark - CarbonTabSwipeNavigation Delegate
- (nonnull UIViewController *)carbonTabSwipeNavigation:(nonnull CarbonTabSwipeNavigation *)carbontTabSwipeNavigation
                                 viewControllerAtIndex:(NSUInteger)index
{
    switch (index)
    {
        case 0:
        {
            TopStoriesViewController *destinationVC = [self.storyboard instantiateViewControllerWithIdentifier:@"TopStoriesViewController"];
            destinationVC.delegate = self;
            return destinationVC;
        }
            break;
            
        case 1:
        {
            VideoViewController *destinationVC = [self.storyboard instantiateViewControllerWithIdentifier:@"VideoViewController"];
            destinationVC.delegate = self;
            return destinationVC;
        }
            break;
            
        case 2:
        {
            PopularViewController *destinationVC = [self.storyboard instantiateViewControllerWithIdentifier:@"PopularViewController"];
            destinationVC.delegate = self;
            return destinationVC;
        }
            break;
            
        case 3:
        {
            TechViewController *destinationVC = [self.storyboard instantiateViewControllerWithIdentifier:@"TechViewController"];
            destinationVC.delegate = self;
            return destinationVC;
        }
            break;
            
        case 4:
        {
            EntertainmentViewController *destinationVC = [self.storyboard instantiateViewControllerWithIdentifier:@"EntertainmentViewController"];
            destinationVC.delegate = self;
            return destinationVC;
        }
            break;
        default:
            break;
    }
    
    return nil;
}

- (void)carbonTabSwipeNavigation:(nonnull CarbonTabSwipeNavigation *)carbonTabSwipeNavigation
                  didMoveAtIndex:(NSUInteger)index
{
    //    NSLog(@"Did move at index: %ld", (unsigned long)index);
}

- (UIBarPosition)barPositionForCarbonTabSwipeNavigation:(nonnull CarbonTabSwipeNavigation *)carbonTabSwipeNavigation
{
    return UIBarPositionTop; // default UIBarPositionTop
}

#pragma mark - TopStoriesViewControllerDelegate
- (void) TopStoriesViewControllerDelegateDidClickOn:(NewsModel *)newsModel
{
    [self gotoDetailsPage:newsModel title:@"Top Stories"];
}

#pragma mark - EntertainmentViewControllerDelegate
- (void) EntertainmentViewControllerDelegateDidClickOn:(NewsModel *)newsModel
{
    [self gotoDetailsPage:newsModel title:@"Entertainment"];
}

#pragma mark - PopularViewControllerDelegate
- (void) PopularViewControllerDelegateDidClickOn:(NewsModel *)newsModel
{
    [self gotoDetailsPage:newsModel title:@"Popular"];
}

#pragma mark - VideoViewControllerDelegate
- (void) VideoViewControllerDelegateDidClickOn:(NewsModel *)newsModel
{
    [self gotoDetailsPage:newsModel title:@"Video"];
}

#pragma mark - TechViewControllerDelegate
- (void) TechViewControllerDelegateDelegateDidClickOn:(NewsModel *)newsModel
{
    [self gotoDetailsPage:newsModel title:@"Tech"];
}

#pragma mark - Private
- (void) gotoDetailsPage:(NewsModel *)model title:(NSString *)title
{
    self.selectedNewsModel = [NewsModel new];
    self.selectedNewsModel = model;
    self.titleString = title;
    [self performSegueWithIdentifier:@"gotoDetailsPageView" sender:self];
}

#pragma mark - Segue
- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"gotoDetailsPageView"])
    {
        DetailsPageViewController *destinationVC = segue.destinationViewController;
        destinationVC.titleString = self.titleString;
        destinationVC.selectedNewsModel = self.selectedNewsModel;
    }
}

@end
