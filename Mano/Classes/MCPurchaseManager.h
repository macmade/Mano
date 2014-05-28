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

@interface MCPurchaseManager: NSObject
{
@protected
    
    
}

+ ( instancetype )sharedInstance;

- ( BOOL )hasProVersion;
- ( BOOL )hasAdFreeVersion;

@end
