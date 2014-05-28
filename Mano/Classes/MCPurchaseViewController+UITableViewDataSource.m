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

#import "MCPurchaseViewController+UITableViewDataSource.h"

static NSString * const __cellID = @"MCPurchaseViewControllerCellID";

@implementation MCPurchaseViewController( UITableViewDataSource )

- ( NSInteger )numberOfSectionsInTableView: ( UITableView * )tableView
{
    ( void )tableView;
    
    return 0;
}

- ( NSInteger )tableView: ( UITableView * )tableView numberOfRowsInSection: ( NSInteger )section
{
    ( void )tableView;
    ( void )section;
    
    return 0;
}

- ( UITableViewCell * )tableView: ( UITableView * )tableView cellForRowAtIndexPath: ( NSIndexPath * )indexPath
{
    UITableViewCell * cell;
    
    ( void )indexPath;
    
    cell = [ tableView dequeueReusableCellWithIdentifier: __cellID ];
    
    if( cell == nil )
    {
        cell = [ [ [ UITableViewCell alloc ] initWithStyle: UITableViewCellStyleSubtitle reuseIdentifier: __cellID ] autorelease ];
    }
    
    return cell;
}

@end
