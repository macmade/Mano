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

#import "MCViewController.h"

@class MCButton;
@class MCGradientView;

@interface MCMainViewController: MCViewController
{
@protected
    
    UIImageView     * _stringViewE1;
    UIImageView     * _stringViewB;
    UIImageView     * _stringViewG;
    UIImageView     * _stringViewD;
    UIImageView     * _stringViewA;
    UIImageView     * _stringViewE2;
    UIView          * _actionView;
    MCButton        * _chooseMusicButton;
    MCButton        * _purchaseButton;
    MCButton        * _stringButton;
    MCButton        * _playButton;
    MCGradientView  * _topGradientView;
    MCGradientView  * _bottomGradientView;
}


@property( nonatomic, readwrite, retain ) IBOutlet UIImageView      * stringViewE1;
@property( nonatomic, readwrite, retain ) IBOutlet UIImageView      * stringViewB;
@property( nonatomic, readwrite, retain ) IBOutlet UIImageView      * stringViewG;
@property( nonatomic, readwrite, retain ) IBOutlet UIImageView      * stringViewD;
@property( nonatomic, readwrite, retain ) IBOutlet UIImageView      * stringViewA;
@property( nonatomic, readwrite, retain ) IBOutlet UIImageView      * stringViewE2;
@property( nonatomic, readwrite, retain ) IBOutlet MCButton         * chooseMusicButton;
@property( nonatomic, readwrite, retain ) IBOutlet MCButton         * purchaseButton;
@property( nonatomic, readwrite, retain ) IBOutlet MCButton         * stringButton;
@property( nonatomic, readwrite, retain ) IBOutlet MCButton         * playButton;
@property( nonatomic, readwrite, retain ) IBOutlet MCGradientView   * topGradientView;
@property( nonatomic, readwrite, retain ) IBOutlet MCGradientView   * bottomGradientView;

- ( IBAction )swipe: ( id )sender;

@end
