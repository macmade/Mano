/*******************************************************************************
 * Copyright (c) 2014, XS-Labs
 * All rights reserved
 ******************************************************************************/

/* $Id$ */

/*!
 * @file            ...
 * @author          Jean-David Gadina <macmade@xs-labs.com>
 * @copyright       (c) 2014, XS-Labs
 */

#import "MCApplicationDelegate.h"
#import "MCMainViewController.h"

@implementation MCApplicationDelegate

@synthesize window              = _window;
@synthesize mainViewController  = _mainViewController;

+ ( instancetype )sharedInstance
{
    return ( MCApplicationDelegate * )( APPLICATION.delegate );
}

- ( void )dealloc
{
    RELEASE_IVAR( _window );
    RELEASE_IVAR( _mainViewController );
    
    [ super dealloc ];
}

- ( BOOL )application: ( UIApplication * )application didFinishLaunchingWithOptions: ( NSDictionary * )options
{
    UIColor * lightGrayColor;
    UIColor * solidColor;
    UIColor * barColor;
    
    ( void )application;
    ( void )options;
    
    lightGrayColor  = HEXCOLOR( 0xF1F1F1, 1 );
    solidColor      = HEXCOLOR( 0xFF2D55, 1 );
    barColor        = HEXCOLOR( 0xF8F8F8, 1 );
    
    [ [ UISwitch        appearance ] setTintColor:                      lightGrayColor ];
    [ [ UISwitch        appearance ] setOnTintColor:                    solidColor ];
    [ [ UINavigationBar appearance ] setTintColor:                      solidColor ];
    [ [ UIToolbar       appearance ] setTintColor:                      solidColor ];
    [ [ UITabBar        appearance ] setTintColor:                      solidColor ];
    [ [ UISearchBar     appearance ] setTintColor:                      solidColor ];
    [ [ UITableView     appearance ] setTintColor:                      solidColor ];
    [ [ UIPageControl   appearance ] setCurrentPageIndicatorTintColor:  solidColor ];
    [ [ UIPageControl   appearance ] setPageIndicatorTintColor:         lightGrayColor ];
    [ [ UINavigationBar appearance ] setBarTintColor:                   barColor ];
    [ [ UIToolbar       appearance ] setBarTintColor:                   barColor ];
    [ [ UISearchBar     appearance ] setBarTintColor:                   barColor ];
    [ [ UITabBar        appearance ] setBarTintColor:                   barColor ];
    
    _mainViewController             = [ MCMainViewController new ];
    self.window.rootViewController  = _mainViewController;
    
    [ self.window makeKeyAndVisible ];
    
    return YES;
}
							
- ( void )applicationWillResignActive: ( UIApplication * )application
{
    ( void )application;
}

- ( void )applicationDidEnterBackground: ( UIApplication * )application
{
    ( void )application;
}

- ( void )applicationWillEnterForeground: ( UIApplication * )application
{
    ( void )application;
}

- ( void )applicationDidBecomeActive: ( UIApplication * )application
{
    ( void )application;
}

- ( void )applicationWillTerminate: ( UIApplication * )application
{
    ( void )application;
}

@end
