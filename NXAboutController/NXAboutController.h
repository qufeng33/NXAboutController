//
//  NXAboutController.h
//  NXAboutControllerDemo
//
//  Created by 蒋瞿风 on 16/6/16.
//  Copyright © 2016年 nightx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NXAboutItem.h"

NS_ASSUME_NONNULL_BEGIN

@interface NXAboutController : UITableViewController

+ (instancetype)viewControllerWithLogo:(nonnull UIImage  *)logo
                             introduce:(nonnull NSString *)introduce
                                 items:(nonnull NSArray <NXAboutItem *>*)items;

- (instancetype)initWithLogo:(nonnull UIImage  *)logo
                   introduce:(nonnull NSString *)introduce
                       items:(nonnull NSArray <NXAboutItem *>*)items;

@end

NS_ASSUME_NONNULL_END