//
//  FeedViewController.m
//  RssReader
//
//  Created by Joffrey Mann on 4/29/15.
//  Copyright (c) 2015 Nutech. All rights reserved.
//

#import "FeedViewController.h"
#import "RSSParser.h"
#import "WebViewController.h"

@interface FeedViewController ()

@property (strong, nonatomic) NSXMLParser *xmlParser;
@property (nonatomic, strong) NSString *title;
@property (strong, nonatomic) NSString *desc;
@property (strong, nonatomic) RSSParser *rssParser;

@end

@implementation FeedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSURL *feedURL = [NSURL URLWithString:self.feed.urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:feedURL];
    
    NSURLConnection *conn = [NSURLConnection connectionWithRequest:request delegate:self];
    
    _rssParser = [[RSSParser alloc]init];
        
    self.xmlView.delegate = self;
    self.xmlView.dataSource = self;
    self.navigationItem.title = [NSString stringWithFormat:@"%@ feed", _feed.name];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _news.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    FeedItem *item = _news[indexPath.row];
    
    cell.textLabel.text = item.title;
    
    cell.detailTextLabel.text = item.pubDate;
    
    return cell;
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    NSLog(@"didReceiveResponse from server");
    _xmlData = [[NSMutableData alloc]init];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [_xmlData appendData:data];
}

-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"%@", error);
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    _xmlParser = [[NSXMLParser alloc]initWithData:_xmlData];
    _xmlParser.delegate = _rssParser;
    [_xmlParser parse];
    _news = _rssParser.feedItems;
    [self.xmlView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSIndexPath *indexPath = [_xmlView indexPathForSelectedRow];
    WebViewController *wvc = segue.destinationViewController;
    FeedItem *selectedItem = _news[indexPath.row];
    wvc.urlString = selectedItem.link;
}

@end
