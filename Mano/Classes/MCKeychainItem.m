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

#import "MCKeychainItem.h"

static NSString * __defaultGroup = nil;

@implementation MCKeychainItem

@synthesize name  = _name;
@synthesize group = _group;

+ ( NSString * )defaultGroup
{
    @synchronized( self )
    {
        return __defaultGroup;
    }
}

+ ( void )setDefaultGroup: ( NSString * )group
{
    @synchronized( self )
    {
        if( group != __defaultGroup )
        {
            [ __defaultGroup release ];
            
            __defaultGroup = [ group copy ];
        }
    }
}

+ ( instancetype )keychainItemWithName: ( NSString * )name
{
    return [ MCKeychainItem keychainItemWithName: name group: [ MCKeychainItem defaultGroup ] ];
}

+ ( instancetype )keychainItemWithName: ( NSString * )name group: ( NSString * )group
{
    return [ [ [ MCKeychainItem alloc ] initWithName: name group: group ] autorelease ];
}

- ( instancetype )initWithName: ( NSString * )name
{
    return [ self initWithName: name group: [ MCKeychainItem defaultGroup ] ];
}

- ( instancetype )initWithName: ( NSString * )name group: ( NSString * )group
{
    if( ( self = [ self init ] ) )
    {
        _name  = [ name copy ];
        _group = [ group copy ];
    }
    
    return self;
}

- ( void )dealloc
{
    RELEASE_IVAR( _name );
    RELEASE_IVAR( _group );
    
    [ super dealloc ];
}

@end
