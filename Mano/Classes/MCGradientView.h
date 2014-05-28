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

@interface MCGradientView: UIView
{
@protected
    
    NSMutableArray  * _colors;
    NSMutableArray  * _locations;
}

- ( void )addColor: ( UIColor * )color toLocation: ( CGFloat )location;

@end
