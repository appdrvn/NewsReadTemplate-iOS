//
//  TechViewController.m
//  AppDrvnNewsApp
//
//  Created by Tang Kean Yong on 1/3/18.
//  Copyright © 2018 KyTang. All rights reserved.
//

#import "TechViewController.h"
#import "ReadCollectionViewCell.h"
#import "VideoCollectionViewCell.h"

@interface TechViewController ()

@property (nonatomic, strong) NSArray *dataArray;

@end

@implementation TechViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.currentCollectionView registerNib:[UINib nibWithNibName:@"ReadCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"ReadCollectionViewCell"];
    [self.currentCollectionView registerNib:[UINib nibWithNibName:@"VideoCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"VideoCollectionViewCell"];
    
    [self triggerManualRefresh];
}

#pragma mark UICollectionView Delegate
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *reusableview = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"FooterView" forIndexPath:indexPath];
    if ([self.dataArray count] != 0)
    {
        if (kind == UICollectionElementKindSectionFooter)
        {
            UICollectionReusableView *reusableview = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"FooterView" forIndexPath:indexPath];
            reusableview.backgroundColor = [UIColor clearColor];
            
            [self.activityViewBot removeFromSuperview];
            self.activityViewBot = [[UIActivityIndicatorView alloc] init];
            self.activityViewBot.frame = CGRectMake([[UIScreen mainScreen] bounds].size.width/2-50, 50/2 - 5 , 12, 12);
            self.activityViewBot.color = [UIColor blackColor];
            [reusableview addSubview:self.activityViewBot];
            [self.activityViewBot startAnimating];
            
            [self.loadMoreLabel removeFromSuperview];
            self.loadMoreLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.activityViewBot.frame.origin.x+self.activityViewBot.frame.size.width+15, self.activityViewBot.frame.origin.y+(self.activityViewBot.frame.size.height/4), [[UIScreen mainScreen] bounds].size.width, 44)];
            self.loadMoreLabel.backgroundColor = [UIColor clearColor];
            self.loadMoreLabel.text = [NSString stringWithFormat:@"Load More"];
            self.loadMoreLabel.textColor = [UIColor blackColor];
            self.loadMoreLabel.font = [UIFont systemFontOfSize:11.0f];
            self.loadMoreLabel.textAlignment = NSTextAlignmentCenter;
            [reusableview addSubview:self.loadMoreLabel];
            [self.loadMoreLabel sizeToFit];
            self.loadMoreLabel.frame = CGRectMake(self.activityViewBot.frame.origin.x+self.activityViewBot.frame.size.width+15, self.activityViewBot.frame.origin.y+(self.activityViewBot.frame.size.height/2)-(self.loadMoreLabel.frame.size.height/2), self.loadMoreLabel.frame.size.width, self.loadMoreLabel.frame.size.height);
            
            return reusableview;
        }
    }
    
    return reusableview;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.dataArray count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ReadCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ReadCollectionViewCell" forIndexPath:indexPath];
    NewsModel *model = (NewsModel *)self.dataArray[indexPath.row];
    switch (model.type)
    {
        case NewsTypesRead:
        {
            ReadCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ReadCollectionViewCell" forIndexPath:indexPath];
            cell.backgroundColor = [UIColor whiteColor];
            [cell updateDisplay:[self.dataArray objectAtIndex:indexPath.row]];
            
            return cell;
        }
            break;
            
        case NewsTypesVideo:
        {
            VideoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"VideoCollectionViewCell" forIndexPath:indexPath];
            cell.backgroundColor = [UIColor videoBgColor];
            [cell updateDisplay:[self.dataArray objectAtIndex:indexPath.row]];
            
            return cell;
        }
            break;
        default:
            break;
    }
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.delegate respondsToSelector:@selector(TechViewControllerDelegateDelegateDidClickOn:)])
    {
        [self.delegate TechViewControllerDelegateDelegateDidClickOn:self.dataArray[indexPath.row]];
    }
}

- (CGSize)fillSizeArray:(int)index
{
    CGFloat padding = 10;
    
    float width = ([[UIScreen mainScreen] bounds].size.width - (padding * 3)) / 2;
    float height = width + 25;
    
    return CGSizeMake(width, height);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return [self fillSizeArray:(int)indexPath.row];
}

#pragma mark - Private
- (void) loadData
{
    // Remove the dummy data before putting the API method
    // You must put the API calling method at here
    
    // Create Dummy Data
    NewsModel *read1 = [NewsModel new];
    read1.type = NewsTypesVideo;
    read1.images = [NSArray arrayWithObjects:@"https://ichef-1.bbci.co.uk/news/500/cpsprodpb/9CE2/production/_99226104_p05r74ys.jpg", nil];
    read1.title = @"Train app could help disabled travellers";
    read1.htmlContent = @"Emily Yates is familiar with being forgotten with when she travels by train. She is a wheelchair user and says on occasions help to get her off a train has not arrived - leaving her stuck in the carriage going beyond her stop.But a new travel app could make this process easier. She went to try it out in its development stage.";
    read1.datetime = @"31 Dec 2017 20:45";
    read1.videoUrl = @"http://www.bbc.com/news/av/embed/p05r70ld/42244769";
    read1.videoDuration = @"0:15";
    
    NewsModel *read2 = [NewsModel new];
    read2.type = NewsTypesRead;
    read2.images = [NSArray arrayWithObjects:@"https://ichef.bbci.co.uk/news/660/cpsprodpb/EEB1/production/_99450116_toasrer.png", nil];
    read2.title = @"Psychedelic toasters fool image recognition tech";
    read2.htmlContent = @"A team of Google researchers has created psychedelic stickers that can fool image recognition software into seeing objects that are not there. Using a toaster as an example, the team produced colourful computer-generated patterns by sampling hundreds of photographs of the appliance. When the patterns were put next to another item, such as a banana, many neural networks saw a toaster instead. The team said the method could be used to \"attack\" image recognition systems. \"These adversarial patches can be printed, added to any scene, photographed, and presented to image classifiers,\" the researchers said.";
    read2.datetime = @"31 Dec 2017 22:45";
    
    NewsModel *read3 = [NewsModel new];
    read3.type = NewsTypesRead;
    read3.images = [NSArray arrayWithObjects:@"https://ichef-1.bbci.co.uk/news/660/cpsprodpb/11373/production/_93551507_switch-3.jpg", nil];
    read3.title = @"Nintendo Switch is fastest-selling US home console";
    read3.htmlContent = @"The Nintendo Switch has been named America's fastest-selling home games console. A total of 4.8 million units were sold in the US during the 10 months following the Switch's launch there on 3 March last year. The Switch breaks tradition with the firm's previous home consoles in allowing owners to use it as a portable console for game-playing on the move. One analyst said Nintendo had completely turned its business around. The previous record for the fastest-selling console in the US was Nintendo's Wii, launched in 2006, which went on to be one of the top-selling consoles in history worldwide. However, the company's next offering - the Wii U - fared much more poorly. As a consequence, Nintendo had been under considerable pressure to deliver a popular device this time around.";
    read3.country = @"";
    read3.datetime = @"1 Jan 2018 08:45";
    
    NewsModel *read4 = [NewsModel new];
    read4.type = NewsTypesVideo;
    read4.images = [NSArray arrayWithObjects:@"https://ichef.bbci.co.uk/news/500/cpsprodpb/A345/production/_99479714_p05stl2t.jpg", nil];
    read4.title = @"CES 2018: Psion PDA gets Android makeover";
    read4.htmlContent = @"A UK start-up is hoping to revive the personal digital assistant (PDA), once the must-have gadget of the '90s, for the smartphone generation. The product is one of many that will be on show at the CES tech show in Las Vegas next week. The BBC's Chris Foxx went hands-on with the Gemini to find out what it can do.";
    read4.datetime = @"1 Jan 2018 20:45";
    read4.videoUrl = @"http://www.bbc.com/news/av/embed/p05ssylx/42580084";
    read4.videoDuration = @"0:15";
    
    NewsModel *read5 = [NewsModel new];
    read5.type = NewsTypesRead;
    read5.images = [NSArray arrayWithObjects:@"https://ichef.bbci.co.uk/news/660/cpsprodpb/13715/production/_99473697_gettyimages-631066360.jpg", nil];
    read5.title = @"Aadhaar: 'Leak' in world's biggest database worries Indians";
    read5.htmlContent = @"Indian officials in charge of a controversial biometric identity scheme have filed a police complaint after a report that citizens' personal details were being sold for as little as 500 rupees ($7.8;£5.8) online. The Unique Identification Authority of India (UIDAI) wants a probe into \"unauthorised access\" to its database. But it said biometric data was safe. The Tribune newspaper claimed that it bought user details via an \"agent\" advertising his services on WhatsApp. The report is the latest revelation against the UIDAI biometric system known as Aadhaar, which means foundation.";
    read5.country = @"";
    read5.datetime = @"2 Jan 2018 20:45";
    
    NewsModel *read6 = [NewsModel new];
    read6.type = NewsTypesRead;
    read6.images = [NSArray arrayWithObjects:@"https://ichef-1.bbci.co.uk/news/660/cpsprodpb/15473/production/_99455178_chip.gif", nil];
    read6.title = @"Rush to fix 'serious' computer chip flaws";
    read6.htmlContent = @"Tech firms are working to fix two major bugs in computer chips that could allow hackers to steal sensitive data. The bugs are an \"absolute disaster\" and need to be fixed promptly, according to one cyber-security researcher. Google researchers said one of the \"serious security flaws\", dubbed \"Spectre\", was found in chips made by Intel, AMD and ARM. The other, known as \"Meltdown\" affects Intel-made chips and a one recent ARM chip. The industry has been aware of the problem for months and hoped to solve it before details were made public. The UK's National Cyber Security Centre (NCSC) said there was no evidence that the vulnerability had been exploited.";
    read6.country = @"";
    read6.datetime = @"3 Jan 2018 01:45";
    
    NewsModel *read7 = [NewsModel new];
    read7.type = NewsTypesRead;
    read7.images = [NSArray arrayWithObjects:@"https://ichef.bbci.co.uk/news/660/cpsprodpb/11522/production/_99464907_mediaitem99464906.jpg", nil];
    read7.title = @"Mark Zuckerberg vows to 'fix' Facebook";
    read7.htmlContent = @"Facebook CEO Mark Zuckerberg has vowed to \"fix\" Facebook, in what he described as his personal challenge for 2018. In a post on his page on the social network, he said it was making too many errors enforcing policies and preventing misuse of its tools. Mr Zuckerberg has famously set himself challenges every year since 2009. Facebook launched in 2004. Social media firms have come under fire for allowing so-called fake news ahead of US and other elections to spread. Facebook in particular has been criticised for allowing Russia-linked political ads in the run-up to the 2016 US presidential vote.";
    read7.country = @"";
    read7.datetime = @"4 Jan 2018 01:45";
    
    NewsModel *read8 = [NewsModel new];
    read8.type = NewsTypesRead;
    read8.images = [NSArray arrayWithObjects:@"https://ichef.bbci.co.uk/news/624/cpsprodpb/D2C9/production/_96116935_038192134-1.jpg", nil];
    read8.title = @"FCC chairman cancels attendance at CES";
    read8.htmlContent = @"Ajit Pai has cancelled an appearance at the Consumer Electronics Show (CES). The Federal Communications Commission chairman was to debate his decision to overturn net neutrality rules. Many protested outside the FCC building ahead of a December vote that ratified his decision, arguing it would makes the internet less open and accessible. Internet service providers will be able to speed up or slow down different companies' data and charge consumers according to the services they access. But the U-turn on the rules faces legal challenges, including one led by New York's attorney general, Eric Schneiderman. There are also accusations the FCC failed to investigate abuse of its public commenting process.";
    read8.country = @"";
    read8.datetime = @"7 Jan 2018 01:45";
    
    NSMutableArray *temp = [NSMutableArray new];
    [temp addObjectsFromArray:@[read1, read2, read3, read4, read5, read6, read7, read8]];
    
    // This method used to check for Load More
    [self finishLoadingDataFromCms:[NSArray arrayWithArray:temp]];
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
