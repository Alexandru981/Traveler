//
//  TRMainNavigationBar.m
//  Traveler
//
//  Created by Alexandru Miculescu on 10/10/2015.
//  Copyright © 2015 Alexandru Miculescu. All rights reserved.
//

#import "TRMainNavigationBar.h"

#define kNAV_BAR_DEFAULT_TITLE_FONT                 TRTitleFontWithSize(30)
#define kNAV_BAR_DEFAULT_BACKGROUND_COLOR           kCOLOR_APPLICATION_TITLE_GREEN
#define kNAV_BAR_DEFAULT_TITLE_COLOR                HEXCOLOR(0xFFFFFFFF)

@interface TRMainNavigationBar ()


@end

@implementation TRMainNavigationBar
@synthesize color = _color;
@synthesize titleColor = _titleColor;
@synthesize titleFont = _titleFont;

#pragma mark - Init

- (instancetype)init
{
    self = [super init];
    
    if (self)
    {
        [self initialize];
    }
    
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    
    if (self)
    {
        [self initialize];
    }
    
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self)
    {
        [self initialize];
    }
    
    return self;
}

- (void)initialize
{
    self.translucent = NO;
    [self restyle];
}

#pragma mark - Setters / Getters

- (void)setColor:(UIColor *)color
{ 
    _color = color;
    [self restyle];
}

- (UIColor *)color
{
    if (!_color)
    {
        _color = kNAV_BAR_DEFAULT_BACKGROUND_COLOR;
    }
    
    return _color;
}

- (void)setTitleColor:(UIColor *)titleColor
{
    _titleColor = titleColor;
    [self restyle];
}

- (UIColor *)titleColor
{
    if (!_titleColor)
    {
        _titleColor = kNAV_BAR_DEFAULT_TITLE_COLOR;
    }
    
    return _titleColor;
}

- (void)setTitleFont:(UIFont *)titleFont
{
    _titleFont = titleFont;
    [self restyle];
}

- (UIFont *)titleFont
{
    if (!_titleFont)
    {
        _titleFont = kNAV_BAR_DEFAULT_TITLE_FONT;
    }
    
    return _titleFont;
}

#pragma mark - LayoutSubviews

- (void)layoutSubviews
{
    [super layoutSubviews];
}

#pragma mark - Restyle

- (void)restyle
{
    self.barTintColor = self.color;
    self.titleTextAttributes = @{NSFontAttributeName : self.titleFont,
                                 NSForegroundColorAttributeName : self.titleColor};
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
