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

@interface MCKeychainItem: NSObject
{
@protected
    
    NSString * _name;
    NSString * _group;
}

@property( atomic, readonly ) NSString * name;
@property( atomic, readonly ) NSString * group;

+ ( NSString * )defaultGroup;
+ ( void )setDefaultGroup: ( NSString * )group;
+ ( instancetype )keychainItemWithName: ( NSString * )name;

+ ( instancetype )keychainItemWithName: ( NSString * )name group: ( NSString * )group;
- ( instancetype )initWithName: ( NSString * )name;
- ( instancetype )initWithName: ( NSString * )name group: ( NSString * )group;

@end
