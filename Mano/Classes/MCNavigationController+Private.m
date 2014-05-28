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

#import "MCNavigationController+Private.h"

@implementation MCNavigationController( Private )

- ( void )setup
{
    self.rootViewController.navigationItem.rightBarButtonItem = [ [ [ UIBarButtonItem alloc ] initWithBarButtonSystemItem: UIBarButtonSystemItemDone target: self action: @selector( done: ) ] autorelease ];
}

@end
