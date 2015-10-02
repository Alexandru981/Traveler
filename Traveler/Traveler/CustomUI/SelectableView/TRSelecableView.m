//
//  TRSelecableView.m
//  Traveler
//
//  Created by Alexandru Miculescu on 30/09/2015.
//  Copyright © 2015 Alexandru Miculescu. All rights reserved.
//

#import "TRSelecableView.h"

#define kCOVER_VIEW_EXPAND_SPEED    1700
#define kCOVER_VIEW_START_DIMEN     20

@implementation TRSelecableView

- (instancetype)init {
    
    self = [super init];
    
    if (self) {
        [self addTapGesture];
        self.clipsToBounds = YES;
    }
    
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    
    if (self) {
        [self addTapGesture];
        self.clipsToBounds = YES;
    }
    
    return self;
}

- (void)addTapGesture {
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
    [self addGestureRecognizer:tap];
}

- (void)tap:(UITapGestureRecognizer*)tap {
    
    CGPoint touchPoint = [tap locationInView:tap.view];
    UIView *cover = [[UIView alloc] initWithFrame:CGRectMake(touchPoint.x - kCOVER_VIEW_START_DIMEN / 2,
                                                             touchPoint.y - kCOVER_VIEW_START_DIMEN / 2,
                                                             kCOVER_VIEW_START_DIMEN,
                                                             kCOVER_VIEW_START_DIMEN)];
    cover.backgroundColor = [self randomColor];
    cover.layer.cornerRadius = cover.frame.size.width / 2;
    cover.userInteractionEnabled = NO;
    [tap.view addSubview:cover];
    
    CGFloat distance = [self distanceForView:tap.view andPoint:touchPoint];
    
    double time = distance / kCOVER_VIEW_EXPAND_SPEED;
    
    [UIView animateWithDuration:time delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        
        cover.frame = CGRectMake(cover.frame.origin.x, cover.frame.origin.y, distance, distance);
        cover.center = touchPoint;
        
    } completion:^(BOOL finished){
        [cover removeFromSuperview];
    }];
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"cornerRadius"];
    animation.timingFunction = [CAMediaTimingFunction     functionWithName:kCAMediaTimingFunctionLinear];
    animation.fromValue = [NSNumber numberWithFloat:cover.layer.cornerRadius];
    animation.toValue = [NSNumber numberWithFloat:cover.frame.size.width / 2];
    animation.duration = time;
    [cover.layer setCornerRadius:cover.frame.size.width / 2];
    [cover.layer addAnimation:animation forKey:@"cornerRadius"];
}

- (CGFloat)distanceForView:(UIView*)view andPoint:(CGPoint)point {
    
    CGFloat distance1 = MAX(point.x, view.frame.size.width - point.x);
    CGFloat distance2 = MAX(point.y, view.frame.size.height - point.y);
    
    return 2 * ceil(sqrt(pow(distance1, 2) + pow(distance2, 2)));
}

- (UIColor*)randomColor {
    
    CGFloat hue = ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from black
    UIColor *color = [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
    
    return color;
}

@end
