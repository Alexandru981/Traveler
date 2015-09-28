//
//  TRCity.m
//  Traveler
//
//  Created by Alexandru Miculescu on 28/09/2015.
//  Copyright © 2015 Alexandru Miculescu. All rights reserved.
//

#import "TRCity.h"
#import "TRCountry.h"

@implementation TRCity

- (instancetype)initWithIdentifier:(NSString*)identifier
                              name:(NSString*)name
                       description:(NSString*)description
                           country:(TRCountry*)country
{
    self = [super init];
    
    if (self)
    {
        self.identifier = identifier;
        self.name = name;
        self.desc = description;
        self.country = country;
    }
    
    return self;
}

#pragma mark - System

- (NSString*)description
{
    return [NSString stringWithFormat:@"<TRCity: name = %@>", self.name];
}

- (BOOL)isEqual:(id)object
{
    if ([object isKindOfClass:[TRCity class]])
    {
        TRCity* otherCity = (TRCity*)object;
        
        return [self.identifier isEqualToString:otherCity.identifier];
    }
    
    return NO;
}

@end
