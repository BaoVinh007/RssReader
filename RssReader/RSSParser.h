//
//  RSSParser.h
//  RssReader
//
//  Created by Joffrey Mann on 4/30/15.
//  Copyright (c) 2015 Nutech. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FeedItem.h"
#import <UIKit/UIKit.h>

@interface RSSParser : NSObject<NSXMLParserDelegate>

@property (nonatomic, assign) BOOL insideItem;

@property (nonatomic, strong) NSMutableArray *feedItems;

@property (strong, nonatomic) FeedItem *feedItem;

@property (strong, nonatomic) NSMutableString *itemString;


@end
