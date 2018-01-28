//
//  TopStoriesViewController.m
//  AppDrvnNewsApp
//
//  Created by Tang Kean Yong on 1/3/18.
//  Copyright © 2018 KyTang. All rights reserved.
//

#import "TopStoriesViewController.h"
#import "TopStoriesUIModel.h"
#import "TopStoriesFirstSectionHeaderView.h"
#import "TopStoriesSectionHeaderView.h"
#import "PopularReadTableViewCell.h"
#import "PopularVideoTableViewCell.h"
#import "RelatedNewsTableViewCell.h"

@interface TopStoriesViewController ()<TopStoriesFirstSectionHeaderViewDelegate>

@property (nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation TopStoriesViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.currentTableView registerNib:[UINib nibWithNibName:@"PopularReadTableViewCell" bundle:nil] forCellReuseIdentifier:@"PopularReadTableViewCell"];
    [self.currentTableView registerNib:[UINib nibWithNibName:@"PopularVideoTableViewCell" bundle:nil] forCellReuseIdentifier:@"PopularVideoTableViewCell"];
    [self.currentTableView registerNib:[UINib nibWithNibName:@"RelatedNewsTableViewCell" bundle:nil] forCellReuseIdentifier:@"RelatedNewsTableViewCell"];
    [self triggerManualRefresh];
}

#pragma mark - TopStoriesFirstSectionHeaderViewDelegate
- (void) TopStoriesFirstSectionHeaderViewDelegateDidClicked
{
    if ([self.delegate respondsToSelector:@selector(TopStoriesViewControllerDelegateDidClickOn:)])
    {
        TopStoriesUIModel *model = (TopStoriesUIModel *)[self.dataArray firstObject];
        NewsModel *news = (NewsModel *)[model.newsArray firstObject];
        [self.delegate TopStoriesViewControllerDelegateDidClickOn:news];
    }
}

#pragma mark - UITableView Delegate
- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.dataArray count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0)
    {
        return 240.0f;
    }
    return 51.0f;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 0)
    {
        TopStoriesUIModel *model = (TopStoriesUIModel *)self.dataArray[section];
        
        TopStoriesFirstSectionHeaderView *sectionHeader = [[TopStoriesFirstSectionHeaderView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 240.0f)];
        sectionHeader.backgroundColor = [UIColor clearColor];
        sectionHeader.delegate = self;
        [sectionHeader updateDisplay:[model.newsArray firstObject]];
        
        return sectionHeader;
    }
    else
    {
        TopStoriesUIModel *model = (TopStoriesUIModel *)self.dataArray[section];
        
        TopStoriesSectionHeaderView *sectionHeader = [[TopStoriesSectionHeaderView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 51.0f)];
        sectionHeader.backgroundColor = [UIColor clearColor];
        [sectionHeader updateDisplay:model.relatedTitle];
        
        return sectionHeader;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 95;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    TopStoriesUIModel *model = (TopStoriesUIModel *)self.dataArray[section];
    if (section == 0)
    {
        return [model.newsArray count]-1;
    }
    else
    {
        return [model.newsArray count];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    PopularReadTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([PopularReadTableViewCell class])];
    if (indexPath.section == 0)
    {
        TopStoriesUIModel *model = (TopStoriesUIModel *)self.dataArray[indexPath.section];
        NewsModel *news = (NewsModel *)model.newsArray[indexPath.row+1];
        switch (news.type)
        {
            case NewsTypesRead:
            {
                PopularReadTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([PopularReadTableViewCell class])];
                cell.backgroundColor = [UIColor clearColor];
                cell.hideNumbering = YES;
                [cell updateDisplay:news];
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
                
                return cell;
            }
                break;
                
            case NewsTypesVideo:
            {
                PopularVideoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([PopularVideoTableViewCell class])];
                cell.backgroundColor = [UIColor clearColor];
                cell.hideNumbering = YES;
                [cell updateDisplay:news];
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
                
                return cell;
            }
                break;
                
            default:
                break;
        }
    }
    else
    {
        TopStoriesUIModel *model = (TopStoriesUIModel *)self.dataArray[indexPath.section];
        NewsModel *news = (NewsModel *)model.newsArray[indexPath.row];
        
        RelatedNewsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([RelatedNewsTableViewCell class])];
        cell.backgroundColor = [UIColor clearColor];
        [cell updateDisplay:news];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        return cell;
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.delegate respondsToSelector:@selector(TopStoriesViewControllerDelegateDidClickOn:)])
    {
        if (indexPath.section == 0)
        {
            TopStoriesUIModel *model = (TopStoriesUIModel *)self.dataArray[indexPath.section];
            NewsModel *news = (NewsModel *)model.newsArray[indexPath.row+1];
            [self.delegate TopStoriesViewControllerDelegateDidClickOn:news];
        }
        else
        {
            TopStoriesUIModel *model = (TopStoriesUIModel *)self.dataArray[indexPath.section];
            NewsModel *news = (NewsModel *)model.newsArray[indexPath.row];
            [self.delegate TopStoriesViewControllerDelegateDidClickOn:news];
        }
    }
}

#pragma mark - Private
- (void) loadData
{
    NewsModel *read1 = [NewsModel new];
    read1.type = NewsTypesRead;
    read1.images = [NSArray arrayWithObjects:@"https://ichef.bbci.co.uk/news/660/cpsprodpb/153D5/production/_99479968_trump.jpg", nil];
    read1.title = @"Trump's mental health and why people are discussing it";
    read1.htmlContent = @"The release of a new book about the Trump presidency has reignited debate about whether or not the US president is mentally ill.<br><br>A debate that has existed since before he took office, it has now reached fever pitch, moving from allegations of clinical narcissism to speculation that his brainpower may be decreasing with age or dementia.<br><br><h2>What are people saying?</h2><br><br>In his book, Fire and Fury, journalist Michael Wolff writes that President Donald Trump is showing worsening signs of mental decline.<br><br>\"Everybody was painfully aware of the increasing pace of his repetitions,\" he writes in Hollywood Reporter.<br><br>\"It used to be inside of 30 minutes he'd repeat, word-for-word and expression-for-expression, the same three stories - now it was within 10 minutes.\"<br><br>Mr Trump has blasted the book, calling it \"full of lies\".<br><br>Mr Wolff adds his voice to those of various psychologists who have spoken out publicly about the symptoms they purport to see in Mr Trump.<br><br>Several books came out on the topic within months of the Trump inauguration: The Dangerous Case of Donald Trump by Bandy X Lee; Twilight of American Sanity by Allen Frances and Fantasyland by Kurt Andersen.<br><br>Dr Lee, who is a psychiatry professor at Yale, told a group of mostly-Democrat senators last month that Mr Trump was \"going to unravel, and we are seeing the signs\".<br><br>Why would it matter?<br><br>In theory it could cost Mr Trump his job.<br><br>Under the 25th amendment to the US Constitution, if the president is deemed to be \"unable to discharge the powers and duties of his office\", the vice-president takes over. His cabinet and the vice-president together would need to kick-start the process, so it's unlikely to happen, but increasing numbers of voices seem to be clamouring for it.";
    read1.country = @"US & Canada";
    read1.datetime = @"4 Jan 2018 01:45";
    read1.relateds = [NSArray new];
    
    NewsModel *read2 = [NewsModel new];
    read2.type = NewsTypesRead;
    read2.images = [NSArray arrayWithObjects:@"https://ichef.bbci.co.uk/news/660/cpsprodpb/A2AF/production/_99474614_043847871-1.jpg", nil];
    read2.title = @"North Korea accepts Olympics talks offer, says South";
    read2.htmlContent = @"North Korea has accepted an offer to attend high-level talks next week, South Korean officials have said.<br><br>The meeting, on 9 January, will focus on finding a way for North Korean athletes to attend the Winter Olympic Games in South Korea in February.<br><br>North Korean leader Kim Jong-un said this week that sending a delegation to the Games would be \"a good opportunity to show unity of the people\".<br><br>The meeting is expected to be held at Panmunjom, on the border.<br><br>These will be the first high-level talks both Koreas have had since December 2015. It is not yet clear who will be attending.<br><br>South Korea's President Moon Jae-in has previously said he sees the Winter Olympics as a \"groundbreaking chance\" to improve relations between the Koreas, two countries still technically at war.";
    read2.country = @"North Korea & South Korea";
    read2.datetime = @"4 Jan 2018 01:45";
    
    NewsModel *read3 = [NewsModel new];
    read3.type = NewsTypesVideo;
    read3.images = [NSArray arrayWithObjects:@"https://ichef-1.bbci.co.uk/news/660/cpsprodpb/11E5B/production/_99470337_comp_ccx25.jpg", nil];
    read3.title = @"Was 2017 a tipping point for women in Hollywood?";
    read3.htmlContent = @"How significant is it that 2017's three top-grossing films had female leads?<br><br>The #MeToo campaign was groundbreaking: it was both personal and anecdotal, yet also a collective roar by women all over the world, sharing stories of sexual assault or harassment.<br><br>They were not just saying how pervasive the behaviour was: it was also a sign of empowerment.";
    read3.country = @"North Korea & South Korea";
    read3.datetime = @"4 Jan 2018 01:45";
    read3.videoDuration = @"0:15";
    
    NewsModel *read4 = [NewsModel new];
    read4.type = NewsTypesRead;
    read4.images = [NSArray arrayWithObjects:@"https://ichef-1.bbci.co.uk/news/660/cpsprodpb/12D53/production/_91393177_mediaitem91393173.jpg", nil];
    read4.title = @"Saudi Arabia gives handout to compensate for new tax.";
    read4.htmlContent = @"State employees in Saudi Arabia are to be given money to compensate for a new sales tax and a rise in fuel prices. King Salman has ordered monthly payments of more than $260 (£190) for the next year. The kingdom has roughly doubled domestic petrol prices and introduced a 5% tax on most goods and services, including food and utility bills. The Saudi government wants to reduce its dependence on oil following recent turbulence in the crude oil market. The United Arab Emirates (UAE) has also introduced a 5% sales tax. The Saudi royal decree says citizens using private health and educations services will be exempt and the state will also pay tax on their first home purchase.";
    read4.country = @"";
    read4.datetime = @"4 Jan 2018 01:45";
    
    read1.relateds = @[read2, read3, read4];
    
    ///////
    NewsModel *video1 = [NewsModel new];
    video1.type = NewsTypesVideo;
    video1.images = [NSArray arrayWithObjects:@"https://ichef.bbci.co.uk/news/660/cpsprodpb/153D5/production/_99479968_trump.jpg", nil];
    video1.title = @"Trump's mental health and why people are discussing it";
    video1.htmlContent = @"The release of a new book about the Trump presidency has reignited debate about whether or not the US president is mentally ill.<br><br>A debate that has existed since before he took office, it has now reached fever pitch, moving from allegations of clinical narcissism to speculation that his brainpower may be decreasing with age or dementia.<br><br><h2>What are people saying?</h2><br><br>In his book, Fire and Fury, journalist Michael Wolff writes that President Donald Trump is showing worsening signs of mental decline.<br><br>\"Everybody was painfully aware of the increasing pace of his repetitions,\" he writes in Hollywood Reporter.<br><br>\"It used to be inside of 30 minutes he'd repeat, word-for-word and expression-for-expression, the same three stories - now it was within 10 minutes.\"<br><br>Mr Trump has blasted the book, calling it \"full of lies\".<br><br>Mr Wolff adds his voice to those of various psychologists who have spoken out publicly about the symptoms they purport to see in Mr Trump.<br><br>Several books came out on the topic within months of the Trump inauguration: The Dangerous Case of Donald Trump by Bandy X Lee; Twilight of American Sanity by Allen Frances and Fantasyland by Kurt Andersen.<br><br>Dr Lee, who is a psychiatry professor at Yale, told a group of mostly-Democrat senators last month that Mr Trump was \"going to unravel, and we are seeing the signs\".<br><br>Why would it matter?<br><br>In theory it could cost Mr Trump his job.<br><br>Under the 25th amendment to the US Constitution, if the president is deemed to be \"unable to discharge the powers and duties of his office\", the vice-president takes over. His cabinet and the vice-president together would need to kick-start the process, so it's unlikely to happen, but increasing numbers of voices seem to be clamouring for it.";
    video1.country = @"US & Canada";
    video1.datetime = @"4 Jan 2018 01:45";
    video1.videoUrl = @"";
    video1.relateds = [NSArray new];
    video1.relateds = @[read2, read3, read4];
    video1.videoDuration = @"0:15";
    
    NewsModel *video2 = [NewsModel new];
    video2.type = NewsTypesVideo;
    video2.images = [NSArray arrayWithObjects:@"https://ichef-1.bbci.co.uk/news/200/cpsprodpb/10CD1/production/_99471886_p05sv347.jpg", nil];
    video2.title = @"A celebration of black female photography";
    video2.htmlContent = @"A photographer and an artist have made an anthology dedicated to female photographers of African descent living around the world. Mfon: Women Photographers of the African Diaspora is believed to be the first collection of its kind for 30 years.";
    video2.country = @"US & Canada";
    video2.datetime = @"4 Jan 2018 01:45";
    video2.videoUrl = @"";
    video2.videoDuration = @"0:12";
    
    NSMutableArray *tempStoriesArray = [NSMutableArray new];
    [tempStoriesArray addObjectsFromArray:@[read1, read2, read4, video1, read3, video2]];
    
    TopStoriesUIModel *stories = [TopStoriesUIModel TopStoriesUIModelWithNewsArray:[tempStoriesArray copy] relatedTitle:@"" cellType:TopStoriesTypesNews];
    
    // >>>>>>>>>> Related - Sports <<<<<<<<<<
    NewsModel *sport1 = [NewsModel new];
    sport1.type = NewsTypesRead;
    sport1.images = [NSArray arrayWithObjects:@"https://ichef.bbci.co.uk/onesport/cps/624/cpsprodpb/1F8E/production/_99487080_holgate_firmino.jpg", nil];
    sport1.title = @"Roberto Firmino-Mason Holgate: Liverpool will fully co-operate with any investigation";
    sport1.htmlContent = @"Liverpool say they will co-operate with any investigation into Roberto Firmino's clash with Mason Holgate in the Reds' 2-1 FA Cup win over Everton.<br><br>Holgate pushed forward Firmino over the advertising hoardings and into the crowd, with the Everton defender left furious after the pair subsequently exchanged angry words.<br><br>The incident - for which neither player was booked - will be in the match report referee Bobby Madley sends to the Football Association, who will decide whether to investigate further.<br><br>\"The club and player will fully co-operate with the relevant authorities to ensure the facts are established in a thorough manner if deemed necessary or requested,\" said a spokesman.<br><br>\"While that process is ongoing, we will not be making any further comment.\"<br><br>Everton boss Sam Allardyce was asked about the incident after the game, and said: \"I haven't found out exactly what happened. I'm here to talk about football not controversial issues.";
    sport1.country = @"Liverpool";
    sport1.datetime = @"3 Jan 2018 01:45";
    
    NewsModel *sport2 = [NewsModel new];
    sport2.type = NewsTypesRead;
    sport2.images = [NSArray arrayWithObjects:@"https://ichef.bbci.co.uk/onesport/cps/800/cpsprodpb/11934/production/_99488917_gettyimages-901749876.jpg", nil];
    sport2.title = @"Brisbane International: Elina Svitolina beats Aliaksandra Sasnovich to title";
    sport2.htmlContent = @"Ukraine's Elina Svitolina won the first WTA title of the year, beating surprise finalist Aliaksandra Sasnovich 6-2 6-1 at the Brisbane International.<br><br>The third seed and world number six looked full of confident against the world number 88 from Belarus who had come through qualifying.<br><br>Svitolina, who had beaten second seed Karolina Pliskova in the semi-final, was in complete control throughout.<br><br>It gives the 23-year-old her 10th WTA career title.<br><br>Meanwhile, top seed Caroline Wozniacki won two matches in just over four hours to set up a final against second seed Julia Gorges at the Auckland Classic.<br><br>The schedule had been affected by rain, forcing organisers to play the quarter-finals and both semi-finals on Saturday and move the final to Sunday.<br><br>Denmark's Wozniacki got the better of 19-year-old American wildcard Sofia Kenin 4-6 6-2 6-4, before defeating US qualifier Sachia Vickery 6-4 6-4.";
    sport2.country = @"Tennis";
    sport2.datetime = @"3 Jan 2018 11:45";
    
    NSMutableArray *tempSportsArray = [NSMutableArray new];
    [tempSportsArray addObjectsFromArray:@[sport1, sport2]];
    TopStoriesUIModel *sport = [TopStoriesUIModel TopStoriesUIModelWithNewsArray:[tempSportsArray copy] relatedTitle:@"Sport" cellType:TopStoriesTypesRelated];
    
    // >>>>>>>>>> Related - Sports <<<<<<<<<<
    NewsModel *tech1 = [NewsModel new];
    tech1.type = NewsTypesRead;
    tech1.images = [NSArray arrayWithObjects:@"https://ichef-1.bbci.co.uk/news/624/cpsprodpb/2D25/production/_99475511_c570f1d6-d92b-40aa-89b7-0ab4a404bac9.jpg", nil];
    tech1.title = @"CES 2018: Tech preview of the show's coolest new products";
    tech1.htmlContent = @"All aboard the (self-driving) bus - next stop, CES: Las Vegas' annual gigantic tech fest.About 4,000 companies - many of them start-ups - are arriving in town this weekend. Over the coming days, they will reveal new products, secure orders and hopefully provide a taste of the future at the trade fair.The event has its roots in consumer gadgets, but now sprawls into fields including artificial intelligence, automobiles, medicine, marketing and even agriculture.Most of the big technology brands in attendance will have something new to brag about. But increasingly, they hold flagship products back for stand-alone events.";
    tech1.country = @"";
    tech1.datetime = @"3 Jan 2018 11:25";
    
    NewsModel *tech2 = [NewsModel new];
    tech2.type = NewsTypesRead;
    tech2.images = [NSArray arrayWithObjects:@"https://ichef.bbci.co.uk/news/500/cpsprodpb/2EB5/production/_99475911_p05ssvgy.jpg", nil];
    tech2.title = @"CES 2018: The house that hears burglars";
    tech2.htmlContent = @"Software that can identify sounds such as windows being smashed has been developed in Cambridge, UK.The BBC's Chris Foxx put Audio Analytics' tool to the test.";
    tech2.country = @"";
    tech2.datetime = @"3 Jan 2018 11:55";
    
    NSMutableArray *tempTechsArray = [NSMutableArray new];
    [tempTechsArray addObjectsFromArray:@[tech1, tech2]];
    TopStoriesUIModel *tech = [TopStoriesUIModel TopStoriesUIModelWithNewsArray:[tempTechsArray copy] relatedTitle:@"Tech" cellType:TopStoriesTypesRelated];
    
    self.dataArray = [NSMutableArray new];
    [self.dataArray addObjectsFromArray:@[stories, sport, tech]];
    
    self.canLoadMore = false;
    dispatch_async(dispatch_get_main_queue(), ^{
        [self doneLoading];
        
        // You may do the empty data checking at here
    });
}

@end
