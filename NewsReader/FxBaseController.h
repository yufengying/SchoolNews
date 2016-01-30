//
//  FxBaseController.h
//  NewsReader
//
//  Created by zhuzhu on 16/1/17.
//  Copyright © 2016年 zhuzhu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FxOperation.h"
#import "FxActivity.h"

@interface FxBaseController : UIViewController <
    FxOperationDelegate> {
    FxOperation   *_operation;
    FxActivity    *_activity;
}

- (void)showIndicator:(NSString *)tipMessage
             autoHide:(BOOL)hide
           afterDelay:(BOOL)delay;
- (void)hideIndicator;

- (void)setNavigationTitleImage:(NSString *)imageName;
- (void)setNavigationLeft:(NSString *)imageName sel:(SEL)sel;
//- (void)setNavigationLeft:(NSString *)imageName;
- (void)setNavigationRight:(NSString *)imageName;
- (void)setStatusBarStyle:(UIStatusBarStyle)style;
- (IBAction)doBack:(id)sender;
@end
