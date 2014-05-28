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

#import "MCMainViewController.h"

@interface MCMainViewController( Private )

- ( void )vibrateString: ( UIView * )stringView;
- ( void )vibrateString: ( NSString * )animationID finished: ( NSNumber * )finished context: ( void * )context;
- ( void )chooseMusic: ( id )sender;
- ( void )purchase: ( id )sender;
- ( void )chooseStrings: ( id )sender;
- ( void )playMusic: ( id )sender;
- ( void )updateStrings;

@end
