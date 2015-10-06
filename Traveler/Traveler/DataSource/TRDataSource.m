//
//  TRDataSource.m
//  Traveler
//
//  Created by Alexandru Miculescu on 28/09/2015.
//  Copyright © 2015 Alexandru Miculescu. All rights reserved.
//

#import "TRDataSource.h"
#import <Parse/Parse.h>
#import "TRParseMacros.h"
#import "TRModelMacros.h"

@interface TRDataSource ()

@property (nonatomic, strong) NSArray* cities;
@property (nonatomic, strong) NSArray* countries;

@end

@implementation TRDataSource

#pragma mark - Initializers

+ (instancetype)sharedInstance
{
    static TRDataSource *sharedInstance;
    static dispatch_once_t dispatchToken;
    
    dispatch_once(&dispatchToken, ^{
        
        sharedInstance = [[TRDataSource alloc] init];
    
    });
    
    return sharedInstance;
}

#pragma mark - Setters / Getters

- (NSArray*)cities
{
    if (!_cities)
    {
        _cities = [NSArray array];
    }
    
    return _cities;
}

- (NSArray*)countries
{
    if (!_countries)
    {
        _countries = [NSArray array];
    }
    
    return _countries;
}

#pragma mark - Get Countries

- (void)getAllCountriesSuccessBlock:(TRDataSourceSuccessBlockArray)success
                          failBlock:(TRDataSourceFailBlock)fail
{
    PFQuery *query = [PFQuery queryWithClassName:kPF_CLASS_COUNTRY];
    
    __weak typeof(self) weakSelf = self;
    
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error){
        
        __strong typeof(weakSelf) strongSelf = weakSelf;
        
        if (error)
        {
            fail(error);
        }
        else
        {
            NSMutableArray *mutableCountries = [strongSelf.countries mutableCopy];
        
            for (PFObject *object in objects)
            {
                TRCountry *country = [[TRCountry alloc] initWithIdentifier:object[kPF_FIELD_ID]
                                                                      name:object[kPF_FIELD_NAME]
                                                                  flagName:nil];
                
                [mutableCountries addObject:country];
            }
            
            strongSelf.countries = mutableCountries;
            
            dispatch_async(tr_dispatch_main_queue, ^{
                
                success(strongSelf.countries);
            });
        }
        
    }];
}

#pragma mark - Get Cities

- (void)getCitiesForCountry:(TRCountry *)country
               successBlock:(TRDataSourceSuccessBlockArray)success
                  failBlock:(TRDataSourceFailBlock)fail
{
    PFObject *pfCountry = [PFObject objectWithoutDataWithClassName:kPF_CLASS_COUNTRY objectId:country.identifier];
    
    PFQuery *query = [PFQuery queryWithClassName:kPF_CLASS_CITY];
    [query whereKey:kPF_FIELD_COUNTRY equalTo:pfCountry];
    
    __weak typeof(self) weakSelf = self;
    
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error){
        
        __strong typeof(weakSelf) strongSelf = weakSelf;
        
        if (error)
        {
            fail(error);
        }
        else
        {
            NSMutableArray *mutableCities = [strongSelf.cities mutableCopy];
            
            for (PFObject *object in objects)
            {
                
                TRCity *city = [[TRCity alloc] initWithIdentifier:object[kPF_FIELD_ID]
                                                             name:object[kPF_FIELD_NAME]
                                                      description:object[kPF_FIELD_DESCRIPTION]
                                                          country:nil];
                
                [mutableCities addObject:city];
            }
            
            strongSelf.cities = mutableCities;
            
            dispatch_async(tr_dispatch_main_queue, ^{
                
                success (self.cities);
            });
            
        }
        
    }];
}

@end
