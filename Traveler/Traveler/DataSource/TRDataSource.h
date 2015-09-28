//
//  TRDataSource.h
//  Traveler
//
//  Created by Alexandru Miculescu on 28/09/2015.
//  Copyright © 2015 Alexandru Miculescu. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^TRDataSourceSuccessBlockArray)(NSArray*);
typedef void (^TRDataSourceFailBlock)(NSError*);

@class TRCountry;

@interface TRDataSource : NSObject

+ (instancetype)sharedInstance;

/*
 *-------------------------------------COUNTRIES--------------------------------------------------
 */
- (void)getAllCountriesSuccessBlock:(TRDataSourceSuccessBlockArray)success
                          failBlock:(TRDataSourceFailBlock)fail;

/*
 *-------------------------------------COUNTRIES--------------------------------------------------
 */
- (void)getAllCountriesSuccess:(TRDataSourceSuccessBlockArray)success;

@end
