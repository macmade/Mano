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

#import "MCPurchaseManager.h"

static MCPurchaseManager * __instance;
static dispatch_once_t     __token;

@implementation MCPurchaseManager

+ ( instancetype )sharedInstance
{
    dispatch_once
    (
        &__token,
        ^( void )
        {
            __instance = [ [ MCPurchaseManager alloc ] init ];
        }
    );
    
    return __instance;
}

- ( BOOL )hasProVersion
{
    return NO;
}

- ( BOOL )hasAdFreeVersion
{
    return NO;
}

@end
