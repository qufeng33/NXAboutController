//
//  NXAboutHeaderCell.h
//  NXAboutControllerDemo
//
//  Created by 蒋瞿风 on 16/6/16.
//  Copyright © 2016年 nightx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NXAboutHeaderCell : UITableViewCell

+ (NSString *)cellIdentifier;

- (void)configWithLogo:(UIImage *)logo
             introduce:(NSString *)introduce;

@end
