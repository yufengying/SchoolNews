//
//  FxDownload.h
//  NewsReader
//
//  Created by hejinbo on 15/7/22.
//  Copyright (c) 2015年 MyCos. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NewsInfo.h"

@interface FxDownload : NSObject

@property(nonatomic, strong)NSMutableDictionary *dictIcons;

+ (FxDownload *)download;

- (void)cancelDownload;
- (void)setNewsIcon:(NewsInfo *)newsInfo
          imageView:(UIImageView *)imageView;

@end
