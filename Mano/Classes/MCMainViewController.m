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

#import "MCMainViewController.h"
#import "MCMainViewController+Private.h"
#import "MCButton.h"
#import "MCPreferences.h"
#import "MCGradientView.h"

@implementation MCMainViewController

@synthesize stringViewE1        = _stringViewE1;
@synthesize stringViewB         = _stringViewB;
@synthesize stringViewG         = _stringViewG;
@synthesize stringViewD         = _stringViewD;
@synthesize stringViewA         = _stringViewA;
@synthesize stringViewE2        = _stringViewE2;
@synthesize chooseMusicButton   = _chooseMusicButton;
@synthesize purchaseButton      = _purchaseButton;
@synthesize stringButton        = _stringButton;
@synthesize playButton          = _playButton;
@synthesize topGradientView     = _topGradientView;
@synthesize bottomGradientView  = _bottomGradientView;

- ( id )init
{
    if( ( self = [ super init ] ) )
    {}
    
    return self;
}

- ( void )dealloc
{
    [ NOTIFICATION_CENTER removeObserver: self ];
    
    RELEASE_IVAR( _stringViewE1 );
    RELEASE_IVAR( _stringViewB );
    RELEASE_IVAR( _stringViewG );
    RELEASE_IVAR( _stringViewD );
    RELEASE_IVAR( _stringViewA );
    RELEASE_IVAR( _stringViewE2 );
    RELEASE_IVAR( _actionView );
    RELEASE_IVAR( _chooseMusicButton );
    RELEASE_IVAR( _purchaseButton );
    RELEASE_IVAR( _stringButton );
    RELEASE_IVAR( _playButton );
    RELEASE_IVAR( _topGradientView );
    RELEASE_IVAR( _bottomGradientView );
    
    [ super dealloc ];
}

- ( void )viewDidLoad
{
    [ super viewDidLoad ];
    
    [ NOTIFICATION_CENTER addObserver: self selector: @selector( updateStrings ) name: MCPreferencesNotificationValueChanged object: MCPreferencesKeyString1 ];
    [ NOTIFICATION_CENTER addObserver: self selector: @selector( updateStrings ) name: MCPreferencesNotificationValueChanged object: MCPreferencesKeyString2 ];
    [ self updateStrings ];
    
    APPLICATION.statusBarStyle = UIStatusBarStyleLightContent;
    
    _chooseMusicButton.target   = self;
    _purchaseButton.target      = self;
    _stringButton.target        = self;
    _playButton.target          = self;
    
    _chooseMusicButton.action   = @selector( chooseMusic: );
    _purchaseButton.action      = @selector( purchase: );
    _stringButton.action        = @selector( chooseStrings: );
    _playButton.action          = @selector( playMusic: );
    
    _chooseMusicButton.image    = [ UIImage imageNamed: @"Music" ];
    _purchaseButton.image       = [ UIImage imageNamed: @"Purchase" ];
    _stringButton.image         = [ UIImage imageNamed: @"Guitar" ];
    _stringButton.image         = [ UIImage imageNamed: @"PLay" ];
    
    [ _topGradientView addColor: [ UIColor blackColor ] toLocation: ( CGFloat )0.00 ];
    [ _topGradientView addColor: [ UIColor blackColor ] toLocation: ( CGFloat )0.40 ];
    [ _topGradientView addColor: [ UIColor clearColor ] toLocation: ( CGFloat )1.00 ];
    
    [ _bottomGradientView addColor: [ UIColor clearColor ] toLocation: ( CGFloat )0.00 ];
    [ _bottomGradientView addColor: [ UIColor blackColor ] toLocation: ( CGFloat )0.40 ];
    [ _bottomGradientView addColor: [ UIColor blackColor ] toLocation: ( CGFloat )1.00 ];
}

- ( void )viewWillAppear: ( BOOL )animated
{
    [ super viewWillAppear: animated ];
    
    if( _actionView == nil )
    {
        {
            CGRect                     frame;
            UISwipeGestureRecognizer * swipeLeft;
            UISwipeGestureRecognizer * swipeRight;
            
            frame           = self.view.frame;
            frame.origin.x  = ( CGFloat )0;
            frame.origin.y  = ( CGFloat )0;
            
            _actionView = [ [ UIView alloc ] initWithFrame: frame ];
            swipeLeft   = [ [ UISwipeGestureRecognizer alloc ] initWithTarget: self action: @selector( swipe: ) ];
            swipeRight  = [ [ UISwipeGestureRecognizer alloc ] initWithTarget: self action: @selector( swipe: ) ];
            
            swipeLeft.direction  = UISwipeGestureRecognizerDirectionLeft;
            swipeRight.direction = UISwipeGestureRecognizerDirectionRight;
            
            [ _actionView addGestureRecognizer: swipeLeft ];
            [ _actionView addGestureRecognizer: swipeRight ];
            [ self.view addSubview: _actionView ];
        }
    }
    
    [ self.view bringSubviewToFront: _bottomGradientView ];
    [ self.view bringSubviewToFront: _topGradientView ];
}

- ( IBAction )swipe: ( id )sender
{
    ( void )sender;
    
    [ self vibrateString: _stringViewE1 ];
    [ self vibrateString: _stringViewB ];
    [ self vibrateString: _stringViewG ];
    [ self vibrateString: _stringViewD ];
    [ self vibrateString: _stringViewA ];
    [ self vibrateString: _stringViewE2 ];
}

@end
