//
//  TRMainViewController.m
//  Traveler
//
//  Created by Alexandru Miculescu on 10/10/2015.
//  Copyright © 2015 Alexandru Miculescu. All rights reserved.
//

#import "TRMainNavigationController.h"
#import "TRMainNavigationBar.h"

@interface TRMainNavigationController () <UINavigationControllerDelegate>

@end

@implementation TRMainNavigationController

#pragma mark - Init

- (instancetype)initWithRootViewController:(UIViewController *)rootViewController
{
    self = [super initWithNavigationBarClass:[TRMainNavigationBar class] toolbarClass:nil];
    
    if (self)
    {
        self.viewControllers = @[rootViewController];
        self.delegate = self;
    }
    
    return self;
}

#pragma mark - View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
//    [self setNeedsStatusBarAppearanceUpdate];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UINavigationControllerDelegate

- (void)navigationController:(UINavigationController *)navigationController
       didShowViewController:(UIViewController *)viewController
                    animated:(BOOL)animated
{
    
}

- (void)navigationController:(UINavigationController *)navigationController
      willShowViewController:(UIViewController *)viewController
                    animated:(BOOL)animated
{

}

@end
