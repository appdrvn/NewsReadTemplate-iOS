## [News Template iOS](http://appdrvn.com/news-template-ios)  [![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
![News Template iOS](https://appdrvn.blob.core.windows.net/a1b84c0f-dac1-4b57-b657-2790410fdc24/0000027_news-template-ios.jpeg "News Template iOS") 

## Introduction
News App Template is based on an information app which is consisting of list view, grid view to display the information, e.g. reads and video information of newspaper. 

The main objective of this template is to assist startups to buy their mobile application faster and easier. 

## Demo
Prototype: https://marvelapp.com/615bded

## How to start
1. This template comes with dummy data in it, if the app need to connect to Web API, then modify ```-(void)loadData``` methods to integrate Web API library.
2. All list is accepting the NSArray/NSMutableArray and also added the method for appending data for the following pages from this method ```-(void)finishLoadingDataFromCms:(NSArray *)results```.
3. Data binding from Web API result to Model object is not included, you have to implement your own data binding.

## What is inside
### Model Classes
#### NewsModel.h
This model class is for all the news. It is the main object in this template. You might set your own property in to this model class.

### Core Classes
#### AppConstants.h
This class used to define some important GLOBAL CONSTANT for the others classes needed which are:
1. `DEFAULT_TAKE`
This used for pagination feature while pulling the number of data from Web API.
2. `BANNER_VIEW_HEIGHT`
This is the ratio of all the banners image to fit all the devices with different resolution sizes.
3. `appThemeColor`
4. `videoBgColor`

#### GeneralHelper.h & .m
This class used to define some GLOBAL methods which able to call by the other classes which are:
1. ```+ (UILabel *) setNavTitle:(NSString *)title withNavItem:(UINavigationItem *)navItem;```
This method used to set the Title in UINavigationBar and able to customise the UILabel.
2. ```+ (void) openBrowserInUrl:(NSString *)urlString;```
This method contains the default opening Safari browser with the url
3. ```+ (void)showAlertMsg:(NSString *)msg;```
This method contains the UIAlertView to display the alert message.

#### BaseViewController.h & .m
This is the superclass for all the ```UIViewController``` classes to inherit. And also able to create some methods are calling by the certain ```UIViewController```.

#### BaseTableViewController.h & .m
This is the superclass of all the ```UIViewController``` classes which contain ```UITableView``` and integrated the Pull To Refresh and Load More features.

#### BaseCollectionViewController.h & .m
This is the superclass of all the ```UIViewController``` classes which contain ```UICollectionView``` and integrated the Pull To Refresh and Load More features.

### ViewController Classes
#### MainPageViewController.h & .m
This UIViewController is using to integrate the beauty tab swipe navigation bar (CarbonKit Library). Able to add more tabs from this method ```- (void) loadData``` & using the CarbonKit Delegate method to control the UIViewController classes. Besides that, able to style the tab swipe navigation bar from this method ```- (void) style```.

There are sample of ViewController classes which used to integrate with Web API:
#### TopStoriesViewController.h & .m
This view controller used to display the top news with containing 2 types of contents which are text and video. First of all, remove all the dummy data from ```-(void)loadData``` method before integrating Web API. While integrating Web API, you can set the ```self.canLoadMore``` to FALSE if don’t need to more data. If load more, remember to pass ```DEFAULT_TAKE``` to pull the number of data when calling the Web API. 

#### VideoViewController.h & .m
This view controller is specially used to display the news which containing the video content only. First of all, remove all the dummy data from ```-(void)loadData``` method before integrating Web API. While integrating Web API, remember to pass ```DEFAULT_TAKE``` to pull the number of data.

#### DetailsPageViewController.h & .m
In this view controller, there have 2 different of ```UITableViewHeaderViews``` which are ```ReadsDetailHeaderView``` and ```VideosDetailHeaderView```. 
```ReadsDetailHeaderView``` used to display the images of the news and the text content.
If there have video content, this view controller will be showing the ```VideosDetailHeaderView``` to display the different User Interface with a play button. Between that, you need to integrate your own video player method if needed.


## File Structure
```
AppDrvnNewsApp
|---AppDrvnNewsApp
|        |---AppDelegate.h
|        |---AppDelegate.m
|        |---Assets.xcassets
|        |---LaunchScreen.storyboard
|        |---Main.storyboard
|        |---Info.plist
|        |---Model
|        |        |---UIModel
|        |        |        |---AboutUIModel.h
|        |        |        |---AboutUIModel.m
|        |        |        |---TopStoriesUIModel.h
|        |        |        |---TopStoriesUIModel.m
|        |        |---NewsModel.h
|        |        |---NewsModel.m
|        |---Core
|        |        |---AppConstants.h
|        |        |---GeneralHelper.h
|        |        |---GeneralHelper.m
|        |        |---ServerEnum.h
|        |---GUI
|        |        |---BaseCollectionViewController.h
|        |        |---BaseCollectionViewController.m
|        |        |---BaseTableViewController.h
|        |        |---BaseTableViewController.m
|        |        |---BaseViewController.h
|        |        |---BaseViewController.m
|        |        |---AboutPage
|        |        |        |---AboutUsViewController.h
|        |        |        |---AboutUsViewController.m
|        |        |        |---AboutHeaderView
|        |        |        |        |---AboutHeaderView.h
|        |        |        |        |---AboutHeaderView.m
|        |        |        |        |---AboutHeaderView.xib
|        |        |        |---AboutTableViewCells
|        |        |        |        |---AboutTableViewCell.h
|        |        |        |        |---AboutTableViewCell.m
|        |        |---DetailsPage
|        |        |        |---DetailsPageViewController.h
|        |        |        |---DetailsPageViewController.m
|        |        |        |---DetailsTableViewCells
|        |        |        |        |---DetailsRelatedSectionHeaderView.h
|        |        |        |        |---DetailsRelatedSectionHeaderView.m
|        |        |        |        |---DetailsRelatedSectionHeaderView.xib
|        |        |        |        |---RelatedReadsTableViewCell.h
|        |        |        |        |---RelatedReadsTableViewCell.m
|        |        |        |        |---RelatedVideoTableViewCell.h
|        |        |        |        |---RelatedVideoTableViewCell.m
|        |        |        |---DetailHeaderViews
|        |        |        |        |---ReadsDetailHeaderView.h
|        |        |        |        |---ReadsDetailHeaderView.m
|        |        |        |        |---ReadsDetailHeaderView.xib
|        |        |        |        |---VideosDetailHeaderView.h
|        |        |        |        |---VideosDetailHeaderView.m
|        |        |        |        |---VideosDetailHeaderView.xib
|        |        |---Entertainment
|        |        |        |---EntertainmentViewController.h
|        |        |        |---EntertainmentViewController.m
|        |        |---Popular
|        |        |        |---PopularViewController.h
|        |        |        |---PopularViewController.m
|        |        |        |---PopularTableViewCells
|        |        |        |        |---PopularReadTableViewCell.h
|        |        |        |        |---PopularReadTableViewCell.m
|        |        |        |        |---PopularReadTableViewCell.xib
|        |        |        |        |---PopularVideoTableViewCell.h
|        |        |        |        |---PopularVideoTableViewCell.m
|        |        |        |        |---PopularVideoTableViewCell.xib
|        |        |        |        |---PopularSectionHeaderView.h
|        |        |        |        |---PopularSectionHeaderView.m
|        |        |        |        |---PopularSectionHeaderView.xib
|        |        |---Tech
|        |        |        |---TechViewController.h
|        |        |        |---TechViewController.m
|        |        |        |---TechCollectionViewCells
|        |        |        |        |---ReadCollectionViewCell.h
|        |        |        |        |---ReadCollectionViewCell.m
|        |        |        |        |---ReadCollectionViewCell.xib
|        |        |        |        |---VideoCollectionViewCell.h
|        |        |        |        |---VideoCollectionViewCell.m
|        |        |        |        |---VideoCollectionViewCell.xib
|        |        |---TopStories
|        |        |        |---TopStoriesViewController.h
|        |        |        |---TopStoriesViewController.m
|        |        |        |---RelatedNewsTableViewCells
|        |        |        |        |---RelatedNewsTableViewCell.h
|        |        |        |        |---RelatedNewsTableViewCell.m
|        |        |        |        |---RelatedNewsTableViewCell.xib
|        |        |        |---TopStoriesSectionHeaderView
|        |        |        |        |---TopStoriesSectionHeaderVIew.h
|        |        |        |        |---TopStoriesSectionHeaderVIew.m
|        |        |        |        |---TopStoriesSectionHeaderVIew.xib
|        |        |        |        |---TopStoriesFirstSectionHeaderView.h
|        |        |        |        |---TopStoriesFirstSectionHeaderView.m
|        |        |        |        |---TopStoriesFirstSectionHeaderView.xib
|        |        |---Video
|        |        |        |---VideoViewController.h
|        |        |        |---VideoViewController.m
|        |        |        |---VideoTableViewCells
|        |        |        |        |---VideoTableViewCell.h
|        |        |        |        |---VideoTableViewCell.m
|        |        |---MainPage
|        |        |        |---MainPageViewController.h
|        |        |        |---MainPageViewController.m
|        |---Library
|        |        |---NSDate+NVTimeAgo
|        |        |---LCBannerView
|        |        |---DACircularProgress
|        |        |---MBProgressHUD
|        |        |---MWPhotoBrowser
|        |        |---SDWebImage
|        |        |---CarbonKit
|        |        |---MSPullToRefreshController
|        |---Resources
|        |        |---Images
|        |---Supporting FIles
|        |        |---main.m
|---Products
|        |---AppDrvnNewsApp.app
```

## Tools and Libraries used
1. LCBannerView - https://github.com/iTofu/LCBannerView
2. MBProgressHUD - https://github.com/jdg/MBProgressHUD
3. MSPullToRefreshController - https://github.com/bogardon/MSPullToRefreshController
4. MWPhotoBrowser - https://github.com/mwaterfall/MWPhotoBrowser
5. DACircularProgress - https://github.com/danielamitay/DACircularProgress
6. SDWebImage - https://github.com/rs/SDWebImage
7. CarbonKit - https://github.com/ermalkaleci/CarbonKit
8. NSDAte+NVTimeAgo - https://github.com/nikilster/NSDate-Time-Ago
9. Icons8 - https://icons8.com/

## Useful Links
1. Appdrvn official website - http://appdrvn.com/ 
2. Appdrvn official facebook page - https://www.facebook.com/appdrvn/ 
3. Appdrvn email address - hello@appdrvn.com 
