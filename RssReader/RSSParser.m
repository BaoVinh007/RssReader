//
//  RSSParser.m
//  RssReader
//
//  Created by Joffrey Mann on 4/30/15.
//  Copyright (c) 2015 Nutech. All rights reserved.
//

#import "RSSParser.h"

@implementation RSSParser

#pragma mark - parser delegate methods

-(void)parserDidStartDocument:(NSXMLParser *)parser
{
    _feedItems = [[NSMutableArray alloc]init];
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    //self.element = elementName;
    if([elementName isEqualToString:@"item"])
    {
        self.insideItem = YES;
        _feedItem = [[FeedItem alloc]init];
    }
    
    if(_insideItem && [elementName isEqualToString:@"title"])
    {
        //create the string buffer so that we can capture the title characters
        _itemString = [[NSMutableString alloc]init];
    }
    
    if(_insideItem && [elementName isEqualToString:@"link"])
    {
        //create the string buffer so that we can capture the title characters
        _itemString = [[NSMutableString alloc]init];
    }
    
    if(_insideItem && [elementName isEqualToString:@"pubDate"])
    {
        //create the string buffer so that we can capture the title characters
        _itemString = [[NSMutableString alloc]init];
    }
    
    //if(_insideItem && [elementName isEqualToString:@"p])
}

-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    if(_itemString != nil)
    {
        //append the characters to the string buffer
        [_itemString appendString:string];
    }
}

-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    if ([elementName isEqualToString:@"item"])
    {
        self.insideItem = NO;
        [_feedItems addObject:_feedItem];
    }
    
    if(_insideItem && [elementName isEqualToString:@"title"])
    {
        NSLog(@"title = %@", _itemString);
        _feedItem.title = _itemString;
        _itemString = nil;
    }
    
    if(_insideItem && [elementName isEqualToString:@"link"])
    {
        NSLog(@"link = %@", _itemString);
        _feedItem.link = _itemString;
        _itemString = nil;
    }
    
    if(_insideItem && [elementName isEqualToString:@"pubDate"])
    {
        NSLog(@"pubDate = %@", _itemString);
        _feedItem.pubDate = _itemString;
        _itemString = nil;
    }
}

//
-(void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError
{
    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Error" message:@"Document was not parsed successfully" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
    [alertView show];
}


@end
