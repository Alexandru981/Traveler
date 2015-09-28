//
//  TRCountry.h
//  Traveler
//
//  Created by Alexandru Miculescu on 28/09/2015.
//  Copyright © 2015 Alexandru Miculescu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TRCountry : NSObject

@property (nonatomic, strong) NSString *identifier;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *flagName;
@property (nonatomic, strong) NSArray *cities;

- (instancetype)initWithIdentifier:(NSString*)identifier
                              name:(NSString*)name
                          flagName:(NSString*)flagName;

@end
