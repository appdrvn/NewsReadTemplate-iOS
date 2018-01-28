//
//  TopStoriesUIModel.m
//  AppDrvnNewsApp
//
//  Created by Tang Kean Yong on 1/6/18.
//  Copyright © 2018 KyTang. All rights reserved.
//

#import "TopStoriesUIModel.h"

@implementation TopStoriesUIModel

+ (id) TopStoriesUIModelWithNewsArray:(NSArray *)newsArray relatedTitle:(NSString *)relatedTitle cellType:(TopStoriesTypes)cellType
{
    TopStoriesUIModel *model = [TopStoriesUIModel new];
    model.newsArray = newsArray;
    model.relatedTitle = relatedTitle;
    model.cellType = cellType;
    
    return model;
}

@end
