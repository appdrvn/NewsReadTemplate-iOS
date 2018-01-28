//
//  AboutUIModel.h
//  AppDrvnNewsApp
//
//  Created by Tang Kean Yong on 1/6/18.
//  Copyright © 2018 KyTang. All rights reserved.
//

#import "AboutUIModel.h"

@implementation AboutUIModel

+ (id) AboutUIModelWithReferenceName:(NSString *)referenceName referenceLink:(NSString *)referenceLink referenceAuthor:(NSString *)referenceAuthor
{
    AboutUIModel *model = [AboutUIModel new];
    model.referenceName = referenceName;
    model.referenceLink = referenceLink;
    model.referenceAuthor = referenceAuthor;
    
    return model;
}

@end
