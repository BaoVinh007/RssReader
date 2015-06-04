//
//  WebViewController.h
//  RssReader
//
//  Created by Joffrey Mann on 5/5/15.
//  Copyright (c) 2015 Nutech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIWebView *webView;

@property (nonatomic, strong) NSString *urlString;

@end
