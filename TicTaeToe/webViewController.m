//
//  webViewController.m
//  TicTaeToe
//
//  Created by Matt on 1/11/15.
//  Copyright (c) 2015 Ryan  Gunn. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()<UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSURL *url = [NSURL URLWithString:@"http://en.wikipedia.org/wiki/Tic-tac-toe"];
    NSURLRequest *URLrequest = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:URLrequest];
}

- (IBAction)backButtonTapped:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
