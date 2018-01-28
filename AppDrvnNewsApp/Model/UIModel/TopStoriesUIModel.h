//
//  TopStoriesUIModel.h
//  AppDrvnNewsApp
//
//  Created by Tang Kean Yong on 1/6/18.
//  Copyright © 2018 KyTang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ServerEnum.h"

@interface TopStoriesUIModel : NSObject

@property (nonatomic) TopStoriesTypes cellType;
@property (nonatomic, strong) NSArray *newsArray;
@property (nonatomic, strong) NSString *relatedTitle;

+ (id) TopStoriesUIModelWithNewsArray:(NSArray *)newsArray relatedTitle:(NSString *)relatedTitle cellType:(TopStoriesTypes)cellType;

@end
