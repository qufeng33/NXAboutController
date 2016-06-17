//
//  NXAboutItem.m
//  NXAboutControllerDemo
//
//  Created by 蒋瞿风 on 16/6/17.
//  Copyright © 2016年 nightx. All rights reserved.
//

#import "NXAboutItem.h"

@implementation NXAboutItem

+ (instancetype)itemWithTitle:(NSString *)title
                       detail:(NSString *)detail
                      handler:(MXAboutItemHandler)handler{
    NXAboutItem *item = [[NXAboutItem alloc] init];
    item.title        = title;
    item.detail       = detail;
    item.handler      = handler;
    return item;
}

@end
