//
//  TRCity.h
//  Traveler
//
//  Created by Alexandru Miculescu on 28/09/2015.
//  Copyright © 2015 Alexandru Miculescu. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TRCountry;

@interface TRCity : NSObject

@property (nonatomic, strong) NSString *identifier;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *desc;
@property (nonatomic, strong) TRCountry* country;

- (instancetype)initWithIdentifier:(NSString*)identifier
                              name:(NSString*)name
                       description:(NSString*)description
                           country:(TRCountry*)country;

@end
