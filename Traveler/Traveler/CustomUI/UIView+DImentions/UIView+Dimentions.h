//
//  UIView+Dimentions.h
//  Traveler
//
//  Created by Alexandru Miculescu on 10/10/2015.
//  Copyright © 2015 Alexandru Miculescu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UIView (Dimentions)

//Basic dimentions
@property (nonatomic, assign, readonly) CGFloat originX;
@property (nonatomic, assign, readonly) CGFloat originY;
@property (nonatomic, assign, readonly) CGFloat width;
@property (nonatomic, assign, readonly) CGFloat height;

//Extra dimentions
@property (nonatomic, assign, readonly) CGFloat rightX;
@property (nonatomic, assign, readonly) CGFloat bottomY;

@end
