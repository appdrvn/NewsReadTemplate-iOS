//
//  AboutUIModel.h
//  AppDrvnNewsApp
//
//  Created by Tang Kean Yong on 1/6/18.
//  Copyright © 2018 KyTang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AboutUIModel : NSObject

@property (nonatomic, strong) NSString *referenceName;
@property (nonatomic, strong) NSString *referenceAuthor;
@property (nonatomic, strong) NSString *referenceLink;
+ (id) AboutUIModelWithReferenceName:(NSString *)referenceName referenceLink:(NSString *)referenceLink referenceAuthor:(NSString *)referenceAuthor;

@end
