//
//  FeedItem.h
//  RssReader
//
//  Created by Joffrey Mann on 4/30/15.
//  Copyright (c) 2015 Nutech. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FeedItem : NSObject

@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *link;
@property (strong, nonatomic) NSString *pubDate;

-(id)initWithTitle:(NSString *)title andLink:(NSString *)link andPubDate:(NSString *)pubDate;

@end
