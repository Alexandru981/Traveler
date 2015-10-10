//
//  UIView+Dimentions.m
//  Traveler
//
//  Created by Alexandru Miculescu on 10/10/2015.
//  Copyright © 2015 Alexandru Miculescu. All rights reserved.
//

#import "UIView+Dimentions.h"

@implementation UIView (Dimentions)

- (CGFloat)originX
{
    return self.frame.origin.x;
}

- (CGFloat)originY
{
    return self.frame.origin.y;
}

- (CGFloat)width
{
    return self.frame.size.width;
}

- (CGFloat)height
{
    return self.frame.size.height;
}

- (CGFloat)rightX
{
    return self.frame.origin.x + self.frame.size.width;
}

- (CGFloat)bottomY
{
    return self.frame.origin.y + self.frame.size.height;
}

@end
