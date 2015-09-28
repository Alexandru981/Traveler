//
//  ViewController.m
//  Traveler
//
//  Created by Alexandru Miculescu on 24/09/2015.
//  Copyright © 2015 Alexandru Miculescu. All rights reserved.
//

#import "ViewController.h"
#import "TRDataSource.h"
#import "TRCountry.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [[TRDataSource sharedInstance] getAllCountriesSuccessBlock:^(NSArray *countries){
        
        
    
    } failBlock:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
