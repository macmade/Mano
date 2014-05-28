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

@interface MCButton: UIView
{
@protected
    
    id            _target;
    SEL           _action;
    UIImage     * _image;
    UIColor     * _color;
    UIImageView * _imageView;
    UIButton    * _button;
}

@property( atomic, readwrite, assign ) id        target;
@property( atomic, readwrite, assign ) SEL       action;
@property( atomic, readwrite, retain ) UIImage * image;
@property( atomic, readwrite, retain ) UIColor * color;

@end
