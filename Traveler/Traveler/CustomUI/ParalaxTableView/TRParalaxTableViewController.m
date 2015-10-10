//
//  TRParalaxTableViewController.m
//  Traveler
//
//  Created by Alexandru Miculescu on 10/10/2015.
//  Copyright © 2015 Alexandru Miculescu. All rights reserved.
//

#import "TRParalaxTableViewController.h"
#define scale 0.6

@interface TRParalaxTableViewController () <UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, assign) CGRect originalImageViewFrame;

@end

@implementation TRParalaxTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UITableView *)tableView
{
    if (!_tableView)
    {
        _tableView = [[UITableView alloc] init];
        _tableView.delegate = self;
        
        [self.view addSubview:_tableView];
    }
    
    return _tableView;
}

- (UIImageView *)imageView
{
    if (!_imageView)
    {
        _imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"testImage.jpg"]];
        _imageView.contentMode = UIViewContentModeScaleAspectFill;
        
        [self.view addSubview:_imageView];
    }
    
    return _imageView;
}


- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    self.imageView.frame = CGRectMake(0, 0, self.view.width, self.view.width * scale);
    self.originalImageViewFrame = self.imageView.frame;
    
    self.tableView.frame = CGRectMake(0, self.imageView.bottomY, self.view.width, self.view.height - self.imageView.bottomY);
    
    [self.view bringSubviewToFront:self.imageView];
}

#pragma mark - UITableViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat contentY = scrollView.contentOffset.y;
    
    if (contentY > 0) return;
    
    contentY *= -1;
    
    CGRect imageFrame = self.originalImageViewFrame;
    imageFrame.size.height += contentY;
    self.imageView.frame = imageFrame;
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
