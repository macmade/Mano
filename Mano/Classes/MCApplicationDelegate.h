/*******************************************************************************
 * Copyright (c) 2014, XS-Labs
 * All rights reserved
 ******************************************************************************/

/* $Id$ */

/*!
 * @header          ...
 * @author          Jean-David Gadina <macmade@xs-labs.com>
 * @copyright       (c) 2014, XS-Labs
 */

@class MCMainViewController;

@interface MCApplicationDelegate: UIResponder < UIApplicationDelegate >
{
@protected
    
    UIWindow                * _window;
    MCMainViewController    * _mainViewController;
}

@property( nonatomic, readwrite, retain ) IBOutlet UIWindow              * window;
@property( nonatomic, readonly          )          MCMainViewController  * mainViewController;

+ ( instancetype )sharedInstance;

@end
