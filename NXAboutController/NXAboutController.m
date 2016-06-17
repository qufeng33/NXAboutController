//
//  NXAboutController.m
//  NXAboutControllerDemo
//
//  Created by 蒋瞿风 on 16/6/16.
//  Copyright © 2016年 nightx. All rights reserved.
//

#import "NXAboutController.h"
#import "NXAboutHeaderCell.h"

static NSString *kaboutCellIdentifier = @"kaboutCellIdentifier";

@interface NXAboutController ()<UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) UIImage *logo;
@property (strong, nonatomic) NSString *introduce;
@property (strong, nonatomic) NSArray  *items;

@end

@implementation NXAboutController

+ (instancetype)viewControllerWithLogo:(UIImage *)logo
                             introduce:(NSString *)introduce
                                 items:(NSArray<NXAboutItem *> *)items{
    return [[self alloc] initWithLogo:logo
                            introduce:introduce
                                items:items];
}

- (instancetype)initWithLogo:(UIImage *)logo
                   introduce:(NSString *)introduce
                       items:(nonnull NSArray<NXAboutItem *> *)items{
    self = [super initWithStyle:UITableViewStyleGrouped];
    if (self) {
        self.logo      = logo;
        self.introduce = introduce;
        self.items     = items;
    }
    return self;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    [self setupUI];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}

- (void)setupUI{
    self.tableView.tableFooterView    = [[UIView alloc] init];
    self.tableView.rowHeight          = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 44;
    [self.tableView registerClass:[NXAboutHeaderCell class] forCellReuseIdentifier:[NXAboutHeaderCell cellIdentifier]];
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.items.count > 0 ? 2 : 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return section == 0?1:self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        NXAboutHeaderCell *cell = [tableView dequeueReusableCellWithIdentifier:[NXAboutHeaderCell cellIdentifier]];
        if (!cell) {
            cell = [[NXAboutHeaderCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[NXAboutHeaderCell cellIdentifier]];
        }
        [cell configWithLogo:self.logo introduce:self.introduce];
        return cell;
    }
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kaboutCellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:kaboutCellIdentifier];
    }
    NXAboutItem *item         = [self.items objectAtIndex:indexPath.row];
    cell.textLabel.text       = item.title;
    cell.textLabel.font       = [UIFont preferredFontForTextStyle:UIFontTextStyleSubheadline];
    cell.detailTextLabel.text = item.detail;
    cell.detailTextLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleFootnote];
    cell.accessoryType        = item.handler ? UITableViewCellAccessoryCheckmark : UITableViewCellAccessoryNone;
    return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 5;
}

@end
