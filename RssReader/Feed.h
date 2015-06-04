//
//  NewsModel.h
//  RssReader
//
//  Created by Joffrey Mann on 4/29/15.
//  Copyright (c) 2015 Nutech. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Feed : NSObject

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *urlString;

-(id)initWithName:(NSString *)name andURL:(NSString *)urlString;

@end
