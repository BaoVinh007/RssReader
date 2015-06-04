//
//  FeedItem.m
//  RssReader
//
//  Created by Joffrey Mann on 4/30/15.
//  Copyright (c) 2015 Nutech. All rights reserved.
//

#import "FeedItem.h"

@implementation FeedItem

-(id)initWithTitle:(NSString *)title andLink:(NSString *)link andPubDate:(NSString *)pubDate
{
    self = [super init];
    
    if(self)
    {
        _title = title;
        _link = link;
        _pubDate = pubDate;
    }
    
    return self;
}

-(id)init
{
    return [self initWithTitle:nil andLink:nil andPubDate:nil];
}
@end
