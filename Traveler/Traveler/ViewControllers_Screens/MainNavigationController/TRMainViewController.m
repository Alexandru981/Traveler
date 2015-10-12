//
//  TRMainViewController.m
//  Traveler
//
//  Created by Alexandru Miculescu on 11/10/2015.
//  Copyright © 2015 Alexandru Miculescu. All rights reserved.
//

#import "TRMainViewController.h"

#define kBACK_BUTTON_IMAGE              @"backButtonImage"

@interface TRMainViewController ()

@end

@implementation TRMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    /*
     ******************** ADD THE DEFAULT BACK BUTTON IMAGE **********************************
     */
    UIImage *backBtnImage = [UIImage imageNamed:kBACK_BUTTON_IMAGE];
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [backBtn setBackgroundImage:backBtnImage forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(backButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    backBtn.frame = CGRectMake(0, 0, backBtnImage.size.width * 0.5, backBtnImage.size.height * 0.5);
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
    self.navigationItem.leftBarButtonItem = backButton;
    
    /*
     ****************************** STATUS BAR STYLE ******************************************
     */
//    [self setNeedsStatusBarAppearanceUpdate];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Back button action

- (void)backButtonPressed
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - Status Bar Style

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
