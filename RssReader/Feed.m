//
//  NewsModel.m
//  RssReader
//
//  Created by Joffrey Mann on 4/29/15.
//  Copyright (c) 2015 Nutech. All rights reserved.
//

#import "Feed.h"

@implementation Feed

-(id)initWithName:(NSString *)name andURL:(NSString *)urlString
{
    self = [super init];
    
    if(self)
    {
        _name = name;
        _urlString = urlString;
    }
    
    return self;
}

-(id)init
{
    return [self initWithName:nil andURL:nil];
}

@end
