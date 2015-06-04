//
//  WebViewController.m
//  RssReader
//
//  Created by Joffrey Mann on 5/5/15.
//  Copyright (c) 2015 Nutech. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()

@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self loadNewsPost];
}

-(void)loadNewsPost
{
    //create a URL object
    NSURL *url = [NSURL URLWithString:_urlString];
    //create a url request
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    //load the request in webview
    [_webView loadRequest:request];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
