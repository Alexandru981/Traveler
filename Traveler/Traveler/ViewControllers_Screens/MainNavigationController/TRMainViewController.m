//
//  TRMainViewController.m
//  Traveler
//
//  Created by Alexandru Miculescu on 11/10/2015.
//  Copyright © 2015 Alexandru Miculescu. All rights reserved.
//

#import "TRMainViewController.h"

#define kBACK_BUTTON_IMAGE              @"backButtonImage"
#define kVIEW_BACKGROUND_COLOR          kCOLOR_WHITE

@interface TRMainViewController ()

@property (nonatomic, assign) BOOL showingNavBar;
@property (nonatomic, strong) UIButton *backButton;

@end

@implementation TRMainViewController

#pragma mark - View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    /*
     ******************** ADD THE DEFAULT BACK BUTTON IMAGE **********************************
     */
    UIImage *backBtnImage = [UIImage imageNamed:kBACK_BUTTON_IMAGE];
    self.backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.backButton setBackgroundImage:backBtnImage forState:UIControlStateNormal];
    [self.backButton addTarget:self action:@selector(backButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    self.backButton.frame = CGRectMake(0, 0, backBtnImage.size.width * 0.5, backBtnImage.size.height * 0.5);
    UIBarButtonItem *backBarButton = [[UIBarButtonItem alloc] initWithCustomView:self.backButton];
    self.navigationItem.leftBarButtonItem = backBarButton;
    
    /*
     ******************* SET VIEW DEFAULT BACKGROUND COLOR *************************************
     */
    self.view.backgroundColor = kVIEW_BACKGROUND_COLOR;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    /*
     ********************* SHOW / HIDE NAVIGATION BAR ******************************************
     */
    self.showingNavBar = [self shouldShowNavigationBar];
    if (self.showingNavBar)
    {
        [self.navigationController setNavigationBarHidden:NO animated:YES];
        self.navigationController.navigationBar.barStyle = [self statusBarStyle] == TRStatusBarStyleLight ? UIBarStyleBlackTranslucent : UIBarStyleDefault;
    }
    else
    {
        [self.navigationController setNavigationBarHidden:YES animated:YES];
        [self setNeedsStatusBarAppearanceUpdate];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Back button

- (void)backButtonPressed
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)setBackButonHidden:(BOOL)hidden
{
    self.backButton.hidden = hidden;
}

#pragma mark - Show Navigation Bar

- (BOOL)shouldShowNavigationBar
{
    return YES;
}

#pragma mark - Status Bar Style

- (UIStatusBarStyle)preferredStatusBarStyle
{
    if ([self statusBarStyle] == TRStatusBarStyleLight)
    {
        return UIStatusBarStyleLightContent;
    }
    else
    {
        return UIStatusBarStyleDefault;
    }
}

- (TRStatusBarStyle)statusBarStyle
{
    return TRStatusBarStyleLight;
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
