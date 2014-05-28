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

#import "MCPreferences.h"

NSString * const MCPreferencesKeyString1                = @"String1";
NSString * const MCPreferencesKeyString2                = @"String2";
NSString * const MCPreferencesNotificationValueChanged  = @"MCPreferencesNotificationValueChanged";

static MCPreferences * __instance;
static dispatch_once_t __token;

@implementation MCPreferences

+ ( instancetype )sharedInstance
{
    dispatch_once
    (
        &__token,
        ^( void )
        {
            __instance = [ [ MCPreferences alloc ] init ];
        }
    );
    
    return __instance;
}

- ( id )init
{
    if( ( self = [ super init ] ) )
    {
        [ DEFAULTS registerDefaults: [ NSDictionary dictionaryWithContentsOfFile: [ BUNDLE pathForResource: @"Defaults" ofType: @"plist" ] ] ];
    }
    
    return self;
}

- ( MCString )string1
{
    @synchronized( self )
    {
        return ( MCString )[ ( NSNumber * )[ DEFAULTS objectForKey: MCPreferencesKeyString1 ] integerValue ];
    }
}

- ( void )setString1: ( MCString )string
{
    @synchronized( self )
    {
        [ DEFAULTS setObject: [ NSNumber numberWithInteger: ( NSInteger )string ] forKey: MCPreferencesKeyString1 ];
        [ DEFAULTS synchronize ];
        [ NOTIFICATION_CENTER postNotificationName: MCPreferencesNotificationValueChanged object: MCPreferencesKeyString1 ];
    }
}

- ( MCString )string2
{
    @synchronized( self )
    {
        return ( MCString )[ ( NSNumber * )[ DEFAULTS objectForKey: MCPreferencesKeyString2 ] integerValue ];
    }
}

- ( void )setString2: ( MCString )string
{
    @synchronized( self )
    {
        [ DEFAULTS setObject: [ NSNumber numberWithInteger: ( NSInteger )string ] forKey: MCPreferencesKeyString2 ];
        [ DEFAULTS synchronize ];
        [ NOTIFICATION_CENTER postNotificationName: MCPreferencesNotificationValueChanged object: MCPreferencesKeyString2 ];
    }
}

@end
