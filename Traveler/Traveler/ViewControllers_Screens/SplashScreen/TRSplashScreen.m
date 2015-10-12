//
//  TRSplashScreen.m
//  Traveler
//
//  Created by Alexandru Miculescu on 10/10/2015.
//  Copyright © 2015 Alexandru Miculescu. All rights reserved.
//

#import "TRSplashScreen.h"
#import "TRRequsetLocationsViewController.h"

#define kTITLE_LABEL_TEXT_SIZE      70
#define kTITLE_LABEL_TEXT_COLOR     [UIColor whiteColor];
#define kTITLE_LABEL_TEXT           @"Traveler"

@interface TRSplashScreen ()

@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation TRSplashScreen

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = kCOLOR_APPLICATION_GREEN;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

#pragma mark - Setters / Getters

- (UILabel *)titleLabel
{
    if (!_titleLabel)
    {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = TRTitleFontWithSize(kTITLE_LABEL_TEXT_SIZE);
        _titleLabel.textColor = kTITLE_LABEL_TEXT_COLOR;
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.text = kTITLE_LABEL_TEXT;
        
        _titleLabel.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(test)];
        [_titleLabel addGestureRecognizer:tap];
    
        [self.view addSubview:_titleLabel];
    }
    
    return _titleLabel;
}

#pragma mark - Layout Subviews

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    CGFloat titleLabelHight = [self.titleLabel.text boundingRectWithSize:CGSizeMake(self.view.width, INT32_MAX)
                                                                 options:NSStringDrawingUsesLineFragmentOrigin
                                                              attributes:@{NSFontAttributeName:self.titleLabel.font}
                                                                 context:nil].size.height;
    
    self.titleLabel.frame = CGRectMake(0,
                                       (self.view.height - titleLabelHight)/2,
                                       self.view.width,
                                       titleLabelHight);
}

- (void)test
{
    TRRequsetLocationsViewController *vc = [[TRRequsetLocationsViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
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
