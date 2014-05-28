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

#import "MCNavigationController.h"
#import "MCNavigationController+Private.h"

@implementation MCNavigationController

+ ( void )presentController: ( UIViewController * )controller onController: ( UIViewController * )presentingController
{
    MCNavigationController * navController;
    
    if( controller == nil || presentingController == nil )
    {
        return;
    }
    
    navController = [ [ MCNavigationController alloc ] initWithRootViewController: controller ];
    
    if( navController != nil )
    {
        navController->_previousStatusBarStyle = APPLICATION.statusBarStyle;
    }
    
    [ APPLICATION setStatusBarStyle: UIStatusBarStyleDefault animated: YES ];
    [ presentingController presentViewController: navController animated: YES completion: ^( void )
        {
            
        }
    ];
    [ navController autorelease ];
}

- ( id )initWithCoder: ( NSCoder * )coder
{
    if( ( self = [ super initWithCoder: coder ] ) )
    {
        [ self setup ];
    }
    
    return self;
}

- ( id )initWithNavigationBarClass: ( Class )navigationBarClass toolbarClass: ( Class )toolbarClass
{
    if( ( self = [ super initWithNavigationBarClass: navigationBarClass toolbarClass: toolbarClass ] ) )
    {
        [ self setup ];
    }
    
    return self;
}

- ( id )initWithNibName: ( NSString * )nib bundle: ( NSBundle * )bundle
{
    if( ( self = [ super initWithNibName: nib bundle: bundle ] ) )
    {
        [ self setup ];
    }
    
    return self;
}

- ( id )initWithRootViewController: ( UIViewController * )controller
{
    if( ( self = [ super initWithRootViewController: controller ] ) )
    {
        [ self setup ];
    }
    
    return self;
}

- ( UIViewController * )rootViewController
{
    if( self.viewControllers.count > 0 )
    {
        return [ self.viewControllers objectAtIndex: 0 ];
    }
    
    return nil;
}

- ( BOOL )canCancel
{
    @synchronized( self )
    {
        return _canCancel;
    }
}

- ( void )setCanCancel: ( BOOL )canCancel
{
    @synchronized( self )
    {
        _canCancel = canCancel;
        
        if( _canCancel )
        {
            self.rootViewController.navigationItem.leftBarButtonItem = [ [ [ UIBarButtonItem alloc ] initWithBarButtonSystemItem: UIBarButtonSystemItemCancel target: self action: @selector( cancel: ) ] autorelease ];
        }
        else
        {
            self.rootViewController.navigationItem.leftBarButtonItem = nil;
        }
        
    }
}

- ( IBAction)cancel: ( id )sender
{
    ( void )sender;
    
    [ APPLICATION setStatusBarStyle: _previousStatusBarStyle animated: YES ];
    [ self dismissViewControllerAnimated: YES completion: NULL ];
}

- ( IBAction)done: ( id )sender
{
    ( void )sender;
    
    [ APPLICATION setStatusBarStyle: _previousStatusBarStyle animated: YES ];
    [ self dismissViewControllerAnimated: YES completion: NULL ];
}

@end
