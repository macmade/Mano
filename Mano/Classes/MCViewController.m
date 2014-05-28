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

#import "MCViewController.h"

static NSString * const MCViewControllerSuffix = @"Controller";

@implementation MCViewController

- ( id )init
{
    NSString * controllerClassName;
    NSString * viewName;
    
    controllerClassName = NSStringFromClass( [ self class ] );
    
    if( [ controllerClassName hasSuffix: MCViewControllerSuffix ] )
    {
        viewName = [ controllerClassName substringToIndex: controllerClassName.length - MCViewControllerSuffix.length ];
        self     = [ super initWithNibName: viewName bundle: nil ];
    }
    else
    {
        self = [ super init ];
    }
    
    return self;
}

@end
