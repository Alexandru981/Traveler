//
//  TRCountry.m
//  Traveler
//
//  Created by Alexandru Miculescu on 28/09/2015.
//  Copyright © 2015 Alexandru Miculescu. All rights reserved.
//

#import "TRCountry.h"
#import "TRCity.h"

@implementation TRCountry

- (instancetype)initWithIdentifier:(NSString*)identifier
                              name:(NSString*)name
                          flagName:(NSString*)flagName
{
    self = [super init];
    
    if (self)
    {
        self.identifier = identifier;
        self.name = name;
        self.flagName = flagName;
    }
    
    return self;
}

#pragma mark - Setters / Getters

- (NSArray *)cities
{
    if (!_cities)
    {
        _cities = [NSArray array];
    }
    
    return _cities;
}

#pragma mark - Utils

- (void)addCity:(TRCity*)city
{
    NSMutableArray* mutableCities = [self.cities mutableCopy];
    [mutableCities addObject:city];
    self.cities = mutableCities;
}

- (void)removeCity:(TRCity*)city
{
    NSMutableArray* mutableCities = [self.cities mutableCopy];
    
    if ([mutableCities containsObject:city])
    {
        [mutableCities removeObject:city];
    }
    
    self.cities = mutableCities;
}

@end
