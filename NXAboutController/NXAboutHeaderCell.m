//
//  NXAboutHeaderCell.m
//  NXAboutControllerDemo
//
//  Created by 蒋瞿风 on 16/6/16.
//  Copyright © 2016年 nightx. All rights reserved.
//

#import "NXAboutHeaderCell.h"
#import <Masonry/Masonry.h>

@interface NXAboutHeaderCell ()

@property (weak, nonatomic) UIImageView *logoView;
@property (weak, nonatomic) UILabel     *versionLabel;
@property (weak, nonatomic) UILabel     *introduceLabel;

@end

@implementation NXAboutHeaderCell

+ (NSString *)cellIdentifier{
    return NSStringFromClass([self class]);
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI{
    self.contentView.backgroundColor  = [UIColor groupTableViewBackgroundColor];

    UIImageView *logoView             = [[UIImageView alloc] init];
    self.logoView                     = logoView;
    self.logoView.clipsToBounds       = YES;
    [self.contentView addSubview:self.logoView];

    UILabel *versionLabel             = [[UILabel alloc] init];
    self.versionLabel                 = versionLabel;
    self.versionLabel.font            = [UIFont preferredFontForTextStyle:UIFontTextStyleFootnote];
    [self.contentView addSubview:self.versionLabel];

    UILabel *introduceLabel           = [[UILabel alloc] init];
    self.introduceLabel               = introduceLabel;
    self.introduceLabel.numberOfLines = 0;
    self.introduceLabel.font          = [UIFont preferredFontForTextStyle:UIFontTextStyleFootnote];
    [self.contentView addSubview:self.introduceLabel];
    
    [self.logoView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top).with.offset(5);
        make.centerX.equalTo(self.contentView);
        make.width.equalTo(self.contentView.mas_width).multipliedBy(0.2);
        make.height.equalTo(self.logoView.mas_width).multipliedBy(1);
    }];
    
    [self.versionLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.contentView);
        make.top.equalTo(self.logoView.mas_bottom).with.offset(5);
    }];
    
    [self.introduceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.versionLabel.mas_bottom).with.offset(10);
        make.left.right.bottom.equalTo(self.contentView).with.insets(UIEdgeInsetsMake(0, 10, 10, 10));
    }];
}

- (void)configWithLogo:(UIImage *)logo
             introduce:(NSString *)introduce{
    self.logoView.image      = logo;
    self.introduceLabel.text = introduce;
    self.versionLabel.text   = [self version];
}

- (NSString *)version{
    return [NSString stringWithFormat:@"v%@ b%@",[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"],[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]];
}

@end
