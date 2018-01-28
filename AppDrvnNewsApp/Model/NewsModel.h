//
//  NewsModel.h
//  AppDrvnNewsApp
//
//  Created by Tang Kean Yong on 1/5/18.
//  Copyright © 2018 KyTang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ServerEnum.h"

@interface NewsModel : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *country;
@property (nonatomic, strong) NSString *datetime; // dd MMM yyyy HH:mm
@property (nonatomic, strong) NSArray *images;
@property (nonatomic, strong) NSString *htmlContent;
@property (nonatomic, strong) NSString *videoUrl;
@property (nonatomic, strong) NSString *shareUrl;
@property (nonatomic, strong) NSArray *relateds;
@property (nonatomic, strong) NSString *videoDuration;
@property (nonatomic) NewsTypes type;

@end
