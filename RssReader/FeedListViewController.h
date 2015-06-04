//
//  ViewController.h
//  RssReader
//
//  Created by Joffrey Mann on 4/29/15.
//  Copyright (c) 2015 Nutech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Feed.h"

@interface FeedListViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) Feed *dataModel;

@property (strong, nonatomic) NSArray *newsStations;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

