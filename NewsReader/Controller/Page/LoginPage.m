//
//  LoginPage.m
//  NewsReader
//
//  Created by zhuzhu on 16/1/17.
//  Copyright © 2016年 zhuzhu. All rights reserved.
//

#import "LoginPage.h"
#import "FxLogin.h"
#import "UserInfo.h"
@implementation LoginPage

-(void)viewDidLoad{
    self.title = LoginTitle;
    [super viewDidLoad];
    [self setNavigationLeft:@"NavigationBack.png" sel:nil];
    [self setNavigationRight:@"NavigationSquare.png"];
}

- (BOOL)checkValidate
{
    BOOL validate = YES;
    
    if (_userName.text.length <= 0 ||
        _password.text.length <= 0) {
        
        validate = NO;
        [self showIndicator:LoginCheckTip
                   autoHide:YES
                 afterDelay:YES];
        
    }
    return validate;
}

- (IBAction)doLoginEvent:(id)sender
{
    if (![self checkValidate]) {
        return;
    }
    [self showIndicator:LoginingTip autoHide:YES afterDelay:YES];
    NSString *body = [NSString stringWithFormat:@"username=%@&password=%@",
                      _userName.text,
                      _password.text 
                      ];
    
    NSDictionary *opInfo = @{@"url":LoginURL,
                             @"body":body};
    
    _operation = [[FxLogin alloc]initWithDelegate:self opInfo:opInfo];
    [_operation executeOp];
}

- (void)opSuccess:(UserInfo *)data
{
    [super opSuccess:data];
//    BASE_INFO_FUN(data.name);
//    BASE_INFO_FUN(data.token);
}

@end
