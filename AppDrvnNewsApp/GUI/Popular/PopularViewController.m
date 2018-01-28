//
//  PopularViewController.m
//  AppDrvnNewsApp
//
//  Created by Tang Kean Yong on 1/3/18.
//  Copyright © 2018 KyTang. All rights reserved.
//

#import "PopularViewController.h"
#import "PopularSectionHeaderView.h"
#import "PopularReadTableViewCell.h"
#import "PopularVideoTableViewCell.h"

@interface PopularViewController ()

@property (nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation PopularViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.currentTableView registerNib:[UINib nibWithNibName:@"PopularReadTableViewCell" bundle:nil] forCellReuseIdentifier:@"PopularReadTableViewCell"];
    [self.currentTableView registerNib:[UINib nibWithNibName:@"PopularVideoTableViewCell" bundle:nil] forCellReuseIdentifier:@"PopularVideoTableViewCell"];
    [self triggerManualRefresh];
}

#pragma mark - UITableView Delegate
- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.dataArray count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 51.0f;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    NSString *sectionTitle = @"";
    switch (section)
    {
        case 0:
            sectionTitle = [NSString stringWithFormat:@"Most Read"];
            break;
        case 1:
            sectionTitle = [NSString stringWithFormat:@"Most Watch"];
            break;
            
        default:
            break;
    }
    PopularSectionHeaderView *sectionHeader = [[PopularSectionHeaderView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 51.0f)];
    sectionHeader.backgroundColor = [UIColor clearColor];
    [sectionHeader updateDisplay:sectionTitle];
    
    return sectionHeader;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 95;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.dataArray[section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    PopularReadTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([PopularReadTableViewCell class])];
    switch (indexPath.section)
    {
        case 0:
        {
            PopularReadTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([PopularReadTableViewCell class])];
            cell.backgroundColor = [UIColor clearColor];
            cell.currentIndex = indexPath.row + 1;
            [cell updateDisplay:self.dataArray[indexPath.section][indexPath.row]];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            
            return cell;
        }
            break;
            
        case 1:
        {
            PopularVideoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([PopularVideoTableViewCell class])];
            cell.backgroundColor = [UIColor clearColor];
            cell.currentIndex = indexPath.row + 1;
            [cell updateDisplay:self.dataArray[indexPath.section][indexPath.row]];
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
    if ([self.delegate respondsToSelector:@selector(PopularViewControllerDelegateDidClickOn:)])
    {
        [self.delegate PopularViewControllerDelegateDidClickOn:self.dataArray[indexPath.section][indexPath.row]];
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
    read1.datetime = @"7 Jan 2018 12:45";
    
    NewsModel *read2 = [NewsModel new];
    read2.type = NewsTypesRead;
    read2.images = [NSArray arrayWithObjects:@"https://ichef.bbci.co.uk/news/660/cpsprodpb/A2AF/production/_99474614_043847871-1.jpg", nil];
    read2.title = @"North Korea accepts Olympics talks offer, says South";
    read2.htmlContent = @"North Korea has accepted an offer to attend high-level talks next week, South Korean officials have said.<br><br>The meeting, on 9 January, will focus on finding a way for North Korean athletes to attend the Winter Olympic Games in South Korea in February.<br><br>North Korean leader Kim Jong-un said this week that sending a delegation to the Games would be \"a good opportunity to show unity of the people\".<br><br>The meeting is expected to be held at Panmunjom, on the border.<br><br>These will be the first high-level talks both Koreas have had since December 2015. It is not yet clear who will be attending.<br><br>South Korea's President Moon Jae-in has previously said he sees the Winter Olympics as a \"groundbreaking chance\" to improve relations between the Koreas, two countries still technically at war.";
    read2.country = @"North Korea & South Korea";
    read2.datetime = @"1 Jan 2018 15:45";
    
    NewsModel *read3 = [NewsModel new];
    read3.type = NewsTypesRead;
    read3.images = [NSArray arrayWithObjects:@"https://ichef-1.bbci.co.uk/news/660/cpsprodpb/11E5B/production/_99470337_comp_ccx25.jpg", nil];
    read3.title = @"How significant is it that 2017's three top-grossing films had female leads?<br><br>The #MeToo campaign was groundbreaking: it was both personal and anecdotal, yet also a collective roar by women all over the world, sharing stories of sexual assault or harassment.<br><br>They were not just saying how pervasive the behaviour was: it was also a sign of empowerment.";
    read3.country = @"North Korea & South Korea";
    read3.datetime = @"1 Jan 2018 20:45";
    
    ///////
    
    NewsModel *video1 = [NewsModel new];
    video1.type = NewsTypesVideo;
    video1.images = [NSArray arrayWithObjects:@"https://ichef.bbci.co.uk/news/660/cpsprodpb/153D5/production/_99479968_trump.jpg", nil];
    video1.title = @"Trump's mental health and why people are discussing it";
    video1.htmlContent = @"The release of a new book about the Trump presidency has reignited debate about whether or not the US president is mentally ill.<br><br>A debate that has existed since before he took office, it has now reached fever pitch, moving from allegations of clinical narcissism to speculation that his brainpower may be decreasing with age or dementia.<br><br><h2>What are people saying?</h2><br><br>In his book, Fire and Fury, journalist Michael Wolff writes that President Donald Trump is showing worsening signs of mental decline.<br><br>\"Everybody was painfully aware of the increasing pace of his repetitions,\" he writes in Hollywood Reporter.<br><br>\"It used to be inside of 30 minutes he'd repeat, word-for-word and expression-for-expression, the same three stories - now it was within 10 minutes.\"<br><br>Mr Trump has blasted the book, calling it \"full of lies\".<br><br>Mr Wolff adds his voice to those of various psychologists who have spoken out publicly about the symptoms they purport to see in Mr Trump.<br><br>Several books came out on the topic within months of the Trump inauguration: The Dangerous Case of Donald Trump by Bandy X Lee; Twilight of American Sanity by Allen Frances and Fantasyland by Kurt Andersen.<br><br>Dr Lee, who is a psychiatry professor at Yale, told a group of mostly-Democrat senators last month that Mr Trump was \"going to unravel, and we are seeing the signs\".<br><br>Why would it matter?<br><br>In theory it could cost Mr Trump his job.<br><br>Under the 25th amendment to the US Constitution, if the president is deemed to be \"unable to discharge the powers and duties of his office\", the vice-president takes over. His cabinet and the vice-president together would need to kick-start the process, so it's unlikely to happen, but increasing numbers of voices seem to be clamouring for it.";
    video1.country = @"US & Canada";
    video1.datetime = @"2 Jan 2018 20:45";
    video1.videoUrl = @"";
    video1.videoDuration = @"0:25";
    
    NewsModel *video2 = [NewsModel new];
    video2.type = NewsTypesVideo;
    video2.images = [NSArray arrayWithObjects:@"https://ichef-1.bbci.co.uk/news/200/cpsprodpb/10CD1/production/_99471886_p05sv347.jpg", nil];
    video2.title = @"A celebration of black female photography";
    video2.htmlContent = @"A photographer and an artist have made an anthology dedicated to female photographers of African descent living around the world. Mfon: Women Photographers of the African Diaspora is believed to be the first collection of its kind for 30 years.";
    video2.country = @"US & Canada";
    video2.datetime = @"3 Jan 2018 20:45";
    video2.videoUrl = @"";
    video2.videoDuration = @"0:15";
    
    NSMutableArray *tempRead = [NSMutableArray new];
    [tempRead addObjectsFromArray:@[read1, read2, read3]];
    
    NSMutableArray *tempVideo = [NSMutableArray new];
    [tempVideo addObjectsFromArray:@[video1, video2]];
    
    self.dataArray = [NSMutableArray new];
    [self.dataArray addObjectsFromArray:@[tempRead, tempVideo]];
    
    
    self.canLoadMore = false;
    dispatch_async(dispatch_get_main_queue(), ^{
        [self doneLoading];
        
        // You may do the empty data checking at here
    });
}


@end
