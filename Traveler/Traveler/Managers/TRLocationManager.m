//
//  TRLocationManager.m
//  Traveler
//
//  Created by Alexandru Miculescu on 06/10/2015.
//  Copyright © 2015 Alexandru Miculescu. All rights reserved.
//

#import "TRLocationManager.h"

@interface TRLocationManager () <CLLocationManagerDelegate>

@property(nonatomic, strong) CLLocationManager *locationManager;

@end

@implementation TRLocationManager

#pragma mark - Initializers

- (instancetype)init
{
    self = [super init];
    
    if (self)
    {
        self.locationManager = [[CLLocationManager alloc] init];
        self.locationManager.delegate = self;
        self.locationManager.distanceFilter = kCLDistanceFilterNone;
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        
        if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)
            [self.locationManager requestWhenInUseAuthorization];
        
        [self.locationManager startUpdatingLocation];
    }
    
    return self;
}

#pragma mark - SharedInstance

+ (instancetype)sharedInstance
{
    static TRLocationManager *sharedInstance;
    
    dispatch_once_t *dispatchToken;
    dispatch_once(dispatchToken, ^{
        sharedInstance = [[TRLocationManager alloc] init];
    });
    
    return sharedInstance;
}

@end
