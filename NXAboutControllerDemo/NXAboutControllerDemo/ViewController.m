//
//  ViewController.m
//  NXAboutControllerDemo
//
//  Created by 蒋瞿风 on 16/6/16.
//  Copyright © 2016年 nightx. All rights reserved.
//

#import "ViewController.h"
#import "NXAboutController.h"
#import <MessageUI/MessageUI.h>

@interface ViewController ()<MFMailComposeViewControllerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showAboutVC:(id)sender{

    NXAboutItem *phoneItem = [NXAboutItem itemWithTitle:@"客服电话" detail:@"400-100-200" handler:^(NXAboutItem *item) {
        NSMutableString * str=[[NSMutableString alloc] initWithFormat:@"telprompt://%@",[item.detail stringByReplacingOccurrencesOfString:@"-" withString:@""]];
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
    }];
    
    NXAboutItem *emailItem = [NXAboutItem itemWithTitle:@"客服邮箱" detail:@"email@email.com" handler:^(NXAboutItem *item) {
        Class mailClass = (NSClassFromString(@"MFMailComposeViewController"));
        if (!mailClass) {
            return;
        }
        if (![mailClass canSendMail]) {
            return;
        }
        MFMailComposeViewController *mailPicker = [[MFMailComposeViewController alloc] init];
        mailPicker.mailComposeDelegate = self;
        //添加收件人
        NSArray *toRecipients = [NSArray arrayWithObject:item.detail];
        [mailPicker setToRecipients: toRecipients];
        [self.navigationController presentViewController:mailPicker animated:YES completion:nil];
    }];
    
    NXAboutItem *wechatItem = [NXAboutItem itemWithTitle:@"官方微信" detail:@"wechat" handler:^(NXAboutItem *item) {
        UIAlertController *controller = [UIAlertController alertControllerWithTitle:@"复制成功" message:@"已经将微信服务号复制到剪贴板，可以去微信里面关注哇!" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
        [controller addAction:cancelAction];
        [self presentViewController:controller animated:YES completion:nil];
    }];
    
    NSArray *items = @[phoneItem,emailItem,wechatItem];
    
    NXAboutController *vc = [[NXAboutController alloc] initWithLogo:[UIImage imageNamed:@"Logo"] introduce:@"腾讯成立于1998年11月，是目前中国领先的互联网综合服务提供商之一。成立10多年以来，腾讯一直秉承“一切以用户价值为依归”的经营理念，为亿级海量用户提供稳定优质的各类服务，始终处于稳健发展的状态。2004年6月16日，腾讯控股有限公司在香港联交所主板公开上市（股票代号700）。" items:items];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - MFMailComposeViewControllerDelegate
- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error{
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

@end