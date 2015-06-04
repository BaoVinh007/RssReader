//
//  ViewController.m
//  RssReader
//
//  Created by Joffrey Mann on 4/29/15.
//  Copyright (c) 2015 Nutech. All rights reserved.
//

#import "FeedListViewController.h"
#import "FeedViewController.h"

@interface FeedListViewController ()

@end

@implementation FeedListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    Feed *feedOne = [[Feed alloc]initWithName:@"CNN" andURL:@"http://rss.cnn.com/rss/cnn_world.rss"];
    Feed *feedTwo = [[Feed alloc]initWithName:@"Engadget" andURL:@"http://www.engadget.com/rss.xml"];
    
    _newsStations = [[NSArray alloc]initWithObjects:feedOne, feedTwo, nil];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_newsStations count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //try to deque a recycled cell
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    Feed *feedName = _newsStations[indexPath.row];
    
    cell.textLabel.text = feedName.name;
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"toFeed" sender:indexPath];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSIndexPath *indexPath = sender;
    Feed *feed = _newsStations[indexPath.row];
    FeedViewController *fController = segue.destinationViewController;
    fController.feed = feed;
}
@end
