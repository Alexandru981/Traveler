//
//  TRMainViewController.h
//  Traveler
//
//  Created by Alexandru Miculescu on 11/10/2015.
//  Copyright © 2015 Alexandru Miculescu. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, TRStatusBarStyle)
{
    TRStatusBarStyleLight,
    TRStatusBarStyleDark
};

@interface TRMainViewController : UIViewController

- (BOOL)shouldShowNavigationBar;
- (TRStatusBarStyle)statusBarStyle;
- (void)setBackButonHidden:(BOOL)hidden;

@end
