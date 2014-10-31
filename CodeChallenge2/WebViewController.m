//
//  WebViewController.m
//  CodeChallenge2
//
//  Created by Andrew Liu on 10/30/14.
//  Copyright (c) 2014 Andrew Liu. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *wikiWebView;

@end

@implementation WebViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSURL *url = [NSURL URLWithString:@"http://en.wikipedia.org/wiki/"];
    NSURLRequest *urlrequest = [NSURLRequest requestWithURL:url];
    [self.wikiWebView  loadRequest:urlrequest];
}
- (IBAction)dismissOnButtonPressed:(UIButton *)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
