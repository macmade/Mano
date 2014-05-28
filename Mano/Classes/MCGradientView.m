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

#import "MCGradientView.h"

@implementation MCGradientView

- ( id )initWithCoder: ( NSCoder * )coder
{
    if( ( self = [ super initWithCoder: coder ] ) )
    {
        _colors     = [ NSMutableArray new ];
        _locations  = [ NSMutableArray new ];
        self.opaque = NO;
    }
    
    return self;
}

- ( id )initWithFrame: ( CGRect )rect
{
    if( ( self = [ super initWithFrame: rect ] ) )
    {
        _colors     = [ NSMutableArray new ];
        _locations  = [ NSMutableArray new ];
        self.opaque = NO;
    }
    
    return self;
}

- ( void )dealloc
{
    RELEASE_IVAR( _colors );
    RELEASE_IVAR( _locations );
    
    [ super dealloc ];
}

- ( void )addColor: ( UIColor * )color toLocation: ( CGFloat )location;
{
    if( color != nil )
    {
        [ _colors    addObject: color ];
        [ _locations addObject: [ NSNumber numberWithDouble: ( double )location ] ];
    }
}

- ( void )drawRect: ( CGRect )rect
{
    CGContextRef     context;
    CGPoint          start;
    CGPoint          end;
    CGColorSpaceRef  colorSpace;
    CGFloat        * locations;
    NSMutableArray * colors;
    CGGradientRef    gradient;
    NSNumber       * n;
    UIColor        * color;
    NSUInteger       i;
    
    context = UIGraphicsGetCurrentContext();
    
    if( _colors.count < 2 )
    {
        return;
    }
    
    locations = ( CGFloat * )calloc( sizeof( CGFloat ), _locations.count );
    
    if( locations == NULL )
    {
        return;
    }
    
    colorSpace  = CGColorSpaceCreateDeviceRGB();
    start       = CGPointMake( CGRectGetMidX( rect ), CGRectGetMinY( rect ) );
    end         = CGPointMake( CGRectGetMidX( rect ), CGRectGetMaxY( rect ) );
    colors      = [ NSMutableArray arrayWithCapacity: _colors.count ];
    
    i = 0;
    
    for( n in _locations )
    {
        locations[ i++ ] = ( CGFloat )[ n doubleValue ];
    }
    
    for( color in _colors )
    {
        [ colors addObject: ( id )( color.CGColor ) ];
    }
    
    gradient = CGGradientCreateWithColors( colorSpace, ( CFArrayRef )colors, locations );
    
    CGContextSaveGState( context );
    CGContextAddRect( context, rect );
    CGContextClip( context );
    CGContextDrawLinearGradient( context, gradient, start, end, 0 );
    CGContextRestoreGState( context );
    CGGradientRelease( gradient );
    CGColorSpaceRelease( colorSpace );
    free( locations );
}

@end
