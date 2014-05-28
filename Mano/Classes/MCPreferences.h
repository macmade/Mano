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

typedef enum
{
    MCStringE1  = 0x00,
    MCStringB   = 0x01,
    MCStringG   = 0x02,
    MCStringD   = 0x03,
    MCStringA   = 0x04,
    MCStringE2  = 0x05,
}
MCString;

FOUNDATION_EXPORT NSString * const MCPreferencesKeyString1;
FOUNDATION_EXPORT NSString * const MCPreferencesKeyString2;

FOUNDATION_EXPORT NSString * const MCPreferencesNotificationValueChanged;

@interface MCPreferences: NSObject
{
@protected
    
    
}

@property( atomic, readwrite, assign ) MCString string1;
@property( atomic, readwrite, assign ) MCString string2;

+ ( instancetype )sharedInstance;

@end
