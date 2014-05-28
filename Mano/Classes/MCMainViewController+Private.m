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

#import "MCMainViewController+Private.h"
#import "MCMainViewController+MPMediaPickerControllerDelegate.h"
#import "MCPurchaseViewController.h"
#import "MCStringViewController.h"
#import "MCNavigationController.h"
#import "MCPurchaseManager.h"
#import "MCPreferences.h"
#import <MediaPlayer/MediaPlayer.h>

static NSString * const MCMainViewControllerStringVibrateAnimationID = @"MCMainViewControllerStringVibrateAnimationID";

@implementation MCMainViewController( Private )

- ( void )vibrateString: ( UIView * )stringView
{
    CGAffineTransform leftTransform;
    CGAffineTransform rightTransform;
    CGFloat           f;
    
    f              = ( CGFloat )2;
    leftTransform  = CGAffineTransformTranslate( CGAffineTransformIdentity,  f, 0 );
    rightTransform = CGAffineTransformTranslate( CGAffineTransformIdentity, -f, 0 );
    
    stringView.transform = leftTransform;
    
    [ UIView beginAnimations: MCMainViewControllerStringVibrateAnimationID context: stringView ];
    
    [ UIView setAnimationRepeatAutoreverses:    YES ];
    [ UIView setAnimationRepeatCount:           ( float )7 ];
    [ UIView setAnimationDuration:              ( NSTimeInterval )0.03 ];
    [ UIView setAnimationDelegate:              self ];
    [ UIView setAnimationDidStopSelector:       @selector( vibrateString:finished:context: ) ];
    
    stringView.transform = rightTransform;
    
    [ UIView commitAnimations ];
}

- ( void )vibrateString: ( NSString * )animationID finished: ( NSNumber * )finished context: ( void * )context
{
    UIView * view;
    
    ( void )animationID;
    
    if
    (
           [ finished boolValue ]
        && [ animationID isEqualToString: MCMainViewControllerStringVibrateAnimationID ]
        && [ ( id )context isKindOfClass: [ UIView class ] ]
    ) 
    {
        view            = ( UIView * )context;
        view.transform  = CGAffineTransformIdentity;
    }
}

- ( void )chooseMusic: ( id )sender
{
    MPMediaPickerController * controller;
    
    ( void )sender;
    
    controller                              = [ [ MPMediaPickerController alloc ] initWithMediaTypes: MPMediaTypeAnyAudio ];
    controller.delegate                     = self;
    controller.allowsPickingMultipleItems   = NO;
    controller.showsCloudItems              = NO;
    
    [ APPLICATION setStatusBarStyle: UIStatusBarStyleDefault animated: YES ];
    [ self presentViewController: controller animated: YES completion: NULL ];
    [ controller autorelease ];
}

- ( void )purchase: ( id )sender
{
    MCPurchaseViewController * controller;
    
    ( void )sender;
    
    controller = [ [ MCPurchaseViewController new ] autorelease ];
    
    [ MCNavigationController presentController: controller onController: self ];
}

- ( void )chooseStrings: ( id )sender
{
    MCStringViewController * controller;
    
    ( void )sender;
    
    controller = [ [ MCStringViewController new ] autorelease ];
    
    [ MCNavigationController presentController: controller onController: self ];
}

- ( void )playMusic: ( id )sender
{
    ( void )sender;
}

- ( void )updateStrings
{
    MCString string1;
    MCString string2;
    
    string1 = [ [ MCPreferences sharedInstance ] string1 ];
    string2 = [ [ MCPreferences sharedInstance ] string2 ];
    
    [ _stringViewE1 setHidden: YES ];
    [ _stringViewB  setHidden: YES ];
    [ _stringViewG  setHidden: YES ];
    [ _stringViewD  setHidden: YES ];
    [ _stringViewA  setHidden: YES ];
    [ _stringViewE2 setHidden: YES ];
    
    switch( string1 )
    {
        case MCStringE1: [ _stringViewE1 setHidden: NO ]; break;
        case MCStringB:  [ _stringViewB  setHidden: NO ]; break;
        case MCStringG:  [ _stringViewG  setHidden: NO ]; break;
        case MCStringD:  [ _stringViewD  setHidden: NO ]; break;
        case MCStringA:  [ _stringViewA  setHidden: NO ]; break;
        case MCStringE2: [ _stringViewE2 setHidden: NO ]; break;
    }
    
    if( [ [ MCPurchaseManager sharedInstance ] hasProVersion ] == NO )
    {
        return;
    }
    
    switch( string2 )
    {
        case MCStringE1: [ _stringViewE1 setHidden: NO ]; break;
        case MCStringB:  [ _stringViewB  setHidden: NO ]; break;
        case MCStringG:  [ _stringViewG  setHidden: NO ]; break;
        case MCStringD:  [ _stringViewD  setHidden: NO ]; break;
        case MCStringA:  [ _stringViewA  setHidden: NO ]; break;
        case MCStringE2: [ _stringViewE2 setHidden: NO ]; break;
    }
    
}

@end
