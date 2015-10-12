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

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
//   
}

- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
//    UIBarButtonItem *backBtn =[[UIBarButtonItem alloc]initWithTitle:@"Puta de maimuta" style:UIBarButtonItemStyleDone target:self action:@selector(test)];
//    self.navigationItem.backBarButtonItem=backBt
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
