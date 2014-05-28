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

@interface MCNavigationController: UINavigationController
{
@protected
    
    BOOL             _canCancel;
    UIStatusBarStyle _previousStatusBarStyle;
}

@property ( atomic, readwrite, assign ) BOOL               canCancel;
@property ( atomic, readonly          ) UIViewController * rootViewController;

+ ( void )presentController: ( UIViewController * )controller onController: ( UIViewController * )presentingController;
- ( IBAction )cancel: ( id )sender;
- ( IBAction )done: ( id )sender;

@end
