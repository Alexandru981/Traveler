//
//  TRGeneralMacros.h
//  Traveler
//
//  Created by Alexandru Miculescu on 28/09/2015.
//  Copyright © 2015 Alexandru Miculescu. All rights reserved.
//

#ifndef TRGeneralMacros_h
#define TRGeneralMacros_h

/*
 ***************************************** MAIN CONTROLLERS ************************************************
 */
#import "TRMainNavigationController.h"
#import "TRMainViewController.h"


/*
 ********************************************* MANAGERS ****************************************************
 */
#import "TRLocationManager.h"

/*
 ******************************************* UTIL MACROS ***************************************************
 */
#define tr_dispatch_main_queue          dispatch_get_main_queue()
#define tr_dispatch_default_queue       dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)

/*
 ********************************************* COLORS ******************************************************
 */
#define kCOLOR_APPLICATION_GREEN        HEXCOLOR(0xFF319F00)

#define HEXCOLOR(rgbValue) \
            [UIColor colorWithRed:((float)((rgbValue & 0x00FF0000) >> 16))/255.0 \
                            green:((float)((rgbValue & 0x0000FF00) >>  8))/255.0 \
                             blue:((float)((rgbValue & 0x000000FF) >>  0))/255.0 \
                            alpha:((float)((rgbValue & 0xFF000000) >> 24))/255.0]


/*
 ********************************************** FONTS ******************************************************
 */
#define TRTitleFontWithSize(fontSize)       [UIFont fontWithName:@"HitchHike" size:fontSize]




#endif /* TRGeneralMacros_h */
