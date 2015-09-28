//
//  TRDataSource.h
//  Traveler
//
//  Created by Alexandru Miculescu on 28/09/2015.
//  Copyright © 2015 Alexandru Miculescu. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TRCountry;

@interface TRDataSource : NSObject

+ (instancetype)sharedInstance;

- (void)getCitiesForCountry:(TRCountry *)country;

@end
