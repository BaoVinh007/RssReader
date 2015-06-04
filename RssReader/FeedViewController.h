//
//  FeedViewController.h
//  RssReader
//
//  Created by Joffrey Mann on 4/29/15.
//  Copyright (c) 2015 Nutech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Feed.h"

@interface FeedViewController : UIViewController<NSURLConnectionDelegate, UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) NSArray *news;

@property (strong, nonatomic) NSMutableData *xmlData;

@property (strong, nonatomic) Feed *feed;

@property (weak, nonatomic) IBOutlet UITableView *xmlView;

@end
