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

#import "MCButton+Private.h"

@implementation MCButton( Private )

- ( void )setup
{
    _imageView  = [ [ UIImageView alloc ] initWithFrame: CGRectMake( ( CGFloat )0, ( CGFloat )0, self.frame.size.width, self.frame.size.height ) ];
    _button     = [ [ UIButton buttonWithType: UIButtonTypeCustom ] retain ];
    self.color  = [ UIColor whiteColor ];
    
    [ _button setFrame: _imageView.frame ];
    [ _button addTarget: self action: @selector( sendAction: ) forControlEvents: UIControlEventTouchUpInside ];
    
    [ self addSubview: _imageView ];
    [ self addSubview: _button ];
    
    self.backgroundColor = [ UIColor clearColor ];
    
    _imageView.contentMode      = UIViewContentModeScaleAspectFit;
    _imageView.autoresizingMask = UIViewAutoresizingFlexibleWidth
                                | UIViewAutoresizingFlexibleHeight
                                | UIViewAutoresizingFlexibleLeftMargin
                                | UIViewAutoresizingFlexibleTopMargin
                                | UIViewAutoresizingFlexibleRightMargin
                                | UIViewAutoresizingFlexibleBottomMargin;
    _button.autoresizingMask    = _imageView.autoresizingMask;
}

- ( void )sendAction: ( id )sender
{
    ( void )sender;
    
    [ _target performSelector: _action withObject: self ];
}

@end
