//
//  NXAboutItem.h
//  NXAboutControllerDemo
//
//  Created by 蒋瞿风 on 16/6/17.
//  Copyright © 2016年 nightx. All rights reserved.
//

#import <Foundation/Foundation.h>

@class NXAboutItem;

typedef void(^MXAboutItemHandler)(NXAboutItem *item);

@interface NXAboutItem : NSObject

@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *detail;
@property (copy  , nonatomic) MXAboutItemHandler handler;

+ (instancetype)itemWithTitle:(NSString *)title
                       detail:(NSString *)detail
                      handler:(MXAboutItemHandler)handler;

@end
