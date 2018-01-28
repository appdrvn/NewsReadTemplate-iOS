//
//  VideoViewController.m
//  AppDrvnNewsApp
//
//  Created by Tang Kean Yong on 1/3/18.
//  Copyright © 2018 KyTang. All rights reserved.
//

#import "VideoViewController.h"
#import "VideoTableViewCell.h"

@interface VideoViewController ()

@property (nonatomic, strong) NSArray *dataArray;

@end

@implementation VideoViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self triggerManualRefresh];
}

#pragma mark - UITableView Delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 240;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.dataArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    VideoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([VideoTableViewCell class])];
    cell.backgroundColor = [UIColor clearColor];
    [cell updateDisplay:self.dataArray[indexPath.row]];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.delegate respondsToSelector:@selector(VideoViewControllerDelegateDidClickOn:)])
    {
        [self.delegate VideoViewControllerDelegateDidClickOn:self.dataArray[indexPath.row]];
    }
}

#pragma mark - Private
- (void) loadData
{
    NewsModel *video1 = [NewsModel new];
    video1.type = NewsTypesVideo;
    video1.images = [NSArray arrayWithObjects:@"https://ichef.bbci.co.uk/news/660/cpsprodpb/153D5/production/_99479968_trump.jpg", nil];
    video1.title = @"Trump's mental health and why people are discussing it";
    video1.htmlContent = @"The release of a new book about the Trump presidency has reignited debate about whether or not the US president is mentally ill.<br><br>A debate that has existed since before he took office, it has now reached fever pitch, moving from allegations of clinical narcissism to speculation that his brainpower may be decreasing with age or dementia.<br><br><h2>What are people saying?</h2><br><br>In his book, Fire and Fury, journalist Michael Wolff writes that President Donald Trump is showing worsening signs of mental decline.<br><br>\"Everybody was painfully aware of the increasing pace of his repetitions,\" he writes in Hollywood Reporter.<br><br>\"It used to be inside of 30 minutes he'd repeat, word-for-word and expression-for-expression, the same three stories - now it was within 10 minutes.\"<br><br>Mr Trump has blasted the book, calling it \"full of lies\".<br><br>Mr Wolff adds his voice to those of various psychologists who have spoken out publicly about the symptoms they purport to see in Mr Trump.<br><br>Several books came out on the topic within months of the Trump inauguration: The Dangerous Case of Donald Trump by Bandy X Lee; Twilight of American Sanity by Allen Frances and Fantasyland by Kurt Andersen.<br><br>Dr Lee, who is a psychiatry professor at Yale, told a group of mostly-Democrat senators last month that Mr Trump was \"going to unravel, and we are seeing the signs\".<br><br>Why would it matter?<br><br>In theory it could cost Mr Trump his job.<br><br>Under the 25th amendment to the US Constitution, if the president is deemed to be \"unable to discharge the powers and duties of his office\", the vice-president takes over. His cabinet and the vice-president together would need to kick-start the process, so it's unlikely to happen, but increasing numbers of voices seem to be clamouring for it.";
    video1.country = @"US & Canada";
    video1.datetime = @"5 Jan 2018 01:45";
    video1.videoUrl = @"";
    video1.videoDuration = @"0:12";
    
    NewsModel *video2 = [NewsModel new];
    video2.type = NewsTypesVideo;
    video2.images = [NSArray arrayWithObjects:@"https://ichef-1.bbci.co.uk/news/200/cpsprodpb/10CD1/production/_99471886_p05sv347.jpg", nil];
    video2.title = @"A celebration of black female photography";
    video2.htmlContent = @"A photographer and an artist have made an anthology dedicated to female photographers of African descent living around the world. Mfon: Women Photographers of the African Diaspora is believed to be the first collection of its kind for 30 years.";
    video2.country = @"US & Canada";
    video2.datetime = @"3 Jan 2018 01:45";
    video2.videoUrl = @"";
    video2.videoDuration = @"0:22";
    
    NewsModel *video3 = [NewsModel new];
    video3.type = NewsTypesVideo;
    video3.images = [NSArray arrayWithObjects:@"https://ichef.bbci.co.uk/news/624/cpsprodpb/11F91/production/_99471637_tv043842534.jpg", nil];
    video3.title = @"'Bomb cyclone' brings travel chaos and deaths to US north-east";
    video3.htmlContent = @"A winter storm has caused travel chaos in the north-east US and is being blamed for up to 17 deaths.Nearly 4,000 US flights were cancelled on Thursday as snow blanketed parts of the north-eastern US seaboard as well as eastern Canada.Boston could get up to 18in (45cm) of snow while rough waters have already triggered coastal floods in the region.The storm, known as a \"bomb cyclone\", is expected to continue to affect eastern North America into the weekend.After the snowfall ends, temperatures are expected to plunge as frigid air lingering over the North Pole heads towards the US mid-Atlantic region.";
    video3.country = @"US & Canada";
    video3.datetime = @"4 Jan 2018 01:45";
    video3.videoUrl = @"";
    video3.videoDuration = @"0:22";
    
    NewsModel *video4 = [NewsModel new];
    video4.type = NewsTypesVideo;
    video4.images = [NSArray arrayWithObjects:@"https://ichef.bbci.co.uk/news/500/cpsprodpb/16484/production/_99486219_p05sz0xw.jpg", nil];
    video4.title = @"Frozen waterfalls form on Chinese mountain";
    video4.htmlContent = @"Frozen waterfalls form on Chinese mountain";
    video4.country = @"Asia";
    video4.datetime = @"4 Jan 2018 01:45";
    video4.videoUrl = @"";
    video4.videoDuration = @"0:17";
    
    NewsModel *video5 = [NewsModel new];
    video5.type = NewsTypesVideo;
    video5.images = [NSArray arrayWithObjects:@"https://ichef.bbci.co.uk/news/500/cpsprodpb/17F59/production/_99473189_gettyimages-174905078.jpg", nil];
    video5.title = @"Would you pay 25p for your coffee cup?";
    video5.htmlContent = @"MPs are calling for a 25p \"latte levy\" on disposable coffee cups to help reduce waste.";
    video5.country = @"UK";
    video5.datetime = @"4 Jan 2018 01:45";
    video5.videoUrl = @"";
    video5.videoDuration = @"0:17";
    
    NewsModel *video6 = [NewsModel new];
    video6.type = NewsTypesVideo;
    video6.images = [NSArray arrayWithObjects:@"https://ichef-1.bbci.co.uk/news/200/cpsprodpb/10CD1/production/_99471886_p05sv347.jpg", nil];
    video6.title = @"A celebration of black female photography";
    video6.htmlContent = @"A photographer and an artist have made an anthology dedicated to female photographers of African descent living around the world. Mfon: Women Photographers of the African Diaspora is believed to be the first collection of its kind for 30 years.";
    video6.country = @"US & Canada";
    video6.datetime = @"4 Jan 2018 01:45";
    video6.videoUrl = @"http://www.bbc.com/news/av/embed/p05syyv5/42586338";
    video6.videoDuration = @"0:27";
    
    NewsModel *video7 = [NewsModel new];
    video7.type = NewsTypesVideo;
    video7.images = [NSArray arrayWithObjects:@"https://ichef-1.bbci.co.uk/news/500/cpsprodpb/FC5D/production/_99450646_p05smy50.jpg", nil];
    video7.title = @"Taking your eyes off the motorway with VR";
    video7.htmlContent = @"Fed up with motorway driving? Now you can switch to virtual reality thanks to a new driverless car from Renault.";
    video7.country = @"World";
    video7.datetime = @"4 Jan 2018 01:45";
    video7.videoUrl = @"http://www.bbc.com/news/av/embed/p05syyv5/42586338";
    video7.videoDuration = @"0:50";
    
    NewsModel *video8 = [NewsModel new];
    video8.type = NewsTypesVideo;
    video8.images = [NSArray arrayWithObjects:@"https://ichef.bbci.co.uk/news/500/cpsprodpb/B1BA/production/_99489454_p05t08v4.jpg", nil];
    video8.title = @"How proton beam therapy kills cancer";
    video8.htmlContent = @"The first high-energy proton beam therapy centre run by the NHS will soon open in Manchester. The BBC's Dominic Hughes explains why it will make such a difference.";
    video8.country = @"World";
    video8.datetime = @"4 Jan 2018 01:45";
    video8.videoUrl = @"http://www.bbc.com/news/av/embed/p05t08bc/42589634";//<iframe width="400" height="500" frameborder="0" src=""></iframe>
    video8.videoDuration = @"0:29";
    
    NSMutableArray *tempVideo = [NSMutableArray new];
    [tempVideo addObjectsFromArray:@[video1, video2, video3, video4, video5, video6, video7, video8]];
    
    // This method used to check for Load More
    [self finishLoadingDataFromCms:[NSArray arrayWithArray:tempVideo]];
}

- (void)finishLoadingDataFromCms:(NSArray *)results
{
    int limit = DEFAULT_TAKE;
    
    if ([results count] == 0)
    {
        self.canLoadMore = false;
        self.shouldShowNoDataImageViewAndLabel = YES;
        [self doneLoading];
        [self checkEmpty];
        return;
    }
    else if([results count] == limit)
    {
        self.currentPage++;
        self.canLoadMore = true;
    }
    else
    {
        self.canLoadMore = false;
    }
    
    if (self.isLoadingMore)
    {
        NSMutableArray * temp = [[NSMutableArray alloc] initWithArray:self.dataArray];
        [temp addObjectsFromArray:results];
        self.dataArray = [NSArray arrayWithArray:temp];
    }
    else
    {
        self.dataArray = results;
    }
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self doneLoading];
        [self checkEmpty];
    });
}

#pragma mark -
- (void) checkEmpty
{
    // You may create your own Empty View while no data pulling from API
}

@end
