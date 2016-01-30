//
//  FxBaseWebPage.m
//  FxHejinbo
//
//  Created by hejinbo on 15/5/15.
//  Copyright (c) 2015年 MyCos. All rights reserved.
//

#import "FxBaseWebPage.h"

@implementation FxBaseWebPage

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self loadHtml];
}

- (void)dealloc
{
    [_webView stopLoading];
    _webView.delegate = nil;
}

- (void)loadHtml
{
    [self showIndicator:LoadingTip autoHide:YES afterDelay:YES];
    
    NSURL *url = [NSURL URLWithString:_urlString];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    
    [_webView loadRequest:request];
}


#pragma mark - UIWebViewDelegate methods

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [self hideIndicator];
}

- (BOOL)webView:(UIWebView *)webView
shouldStartLoadWithRequest:(NSURLRequest*)request
 navigationType:(UIWebViewNavigationType)navigationType
{
    return YES;
}


@end
