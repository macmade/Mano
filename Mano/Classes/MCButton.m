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

#import "MCButton.h"
#import "MCButton+Private.h"

@implementation MCButton

@synthesize target  = _target;
@synthesize action  = _action;

- ( id )initWithCoder: ( NSCoder * )coder
{
    if( ( self = [ super initWithCoder: coder ] ) )
    {
        [ self setup ];
    }
    
    return self;
}

- ( id )initWithFrame: ( CGRect )frame
{
    if( ( self = [ super initWithFrame: frame ] ) )
    {
        [ self setup ];
    }
    
    return self;
}

- ( void )dealloc
{
    RELEASE_IVAR( _image );
    RELEASE_IVAR( _color );
    RELEASE_IVAR( _imageView );
    RELEASE_IVAR( _button );
    
    [ super dealloc ];
}

- ( UIColor * )color
{
    @synchronized( self )
    {
        return _color;
    }
}

- ( void )setColor: ( UIColor * )color
{
    @synchronized( self )
    {
        if( color != _color )
        {
            RELEASE_IVAR( _color );
            
            _color = [ color retain ];
            
            [ _imageView setTintColor: _color ];
        }
    }
}

- ( UIImage * )image
{
    @synchronized( self )
    {
        return _image;
    }
}

- ( void )setImage: ( UIImage * )image
{
    @synchronized( self )
    {
        if( image != _image )
        {
            RELEASE_IVAR( _image );
            
            _image           = [ [ image imageWithRenderingMode: UIImageRenderingModeAlwaysTemplate ] retain ];
            _imageView.image = _image;
        }
    }
}

- ( void )drawRect: ( CGRect )rect
{
    CGContextRef context;
    CGRect       borderRect;
    CGFloat      borderWidth;
    CGFloat      r;
    CGFloat      g;
    CGFloat      b;
    CGFloat      a;
    
    ( void )rect;
    
    r = ( CGFloat )1;
    g = ( CGFloat )1;
    b = ( CGFloat )1;
    a = ( CGFloat )1;
    
    [ _color getRed: &r green: &g blue: &b alpha: &a ];
    
    borderWidth = ( CGFloat )2;
    context     = UIGraphicsGetCurrentContext();
    borderRect  = CGRectMake( ( CGFloat )0, ( CGFloat )0, self.frame.size.width, self.frame.size.height );
    
    borderRect.origin.x    += borderWidth;
    borderRect.origin.y    += borderWidth;
    borderRect.size.width  -= borderWidth * ( CGFloat )2;
    borderRect.size.height -= borderWidth * ( CGFloat )2;
    
    CGContextSetRGBStrokeColor( context, r, g, b, a );
    
    CGContextSetRGBFillColor( context, r, g, b, a / ( CGFloat )10 );
    
    CGContextSetLineWidth( context, borderWidth );
    CGContextFillEllipseInRect( context, borderRect );
    CGContextStrokeEllipseInRect( context, borderRect );
    CGContextFillPath( context );
    
    [ super drawRect: rect ];
}

@end
