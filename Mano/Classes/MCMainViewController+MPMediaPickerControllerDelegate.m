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

#import "MCMainViewController+MPMediaPickerControllerDelegate.h"

@implementation MCMainViewController( MPMediaPickerControllerDelegate )

- ( void )mediaPicker: ( MPMediaPickerController * )picker didPickMediaItems: ( MPMediaItemCollection * )items
{
    ( void )picker;
    ( void )items;
}

- ( void )mediaPickerDidCancel: ( MPMediaPickerController * )picker
{
    [ APPLICATION setStatusBarStyle: UIStatusBarStyleLightContent animated: YES ];
    [ picker dismissViewControllerAnimated: YES completion: NULL ];
}

@end
