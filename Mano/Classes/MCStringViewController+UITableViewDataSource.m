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

#import "MCStringViewController+UITableViewDataSource.h"
#import "MCPreferences.h"
#import "MCPurchaseManager.h"

static NSString * const __cellID = @"MCStringViewControllerCellID";

@implementation MCStringViewController( UITableViewDataSource )

- ( NSInteger )numberOfSectionsInTableView: ( UITableView * )tableView
{
    ( void )tableView;
    
    return 2;
}

- ( NSInteger )tableView: ( UITableView * )tableView numberOfRowsInSection: ( NSInteger )section
{
    ( void )tableView;
    ( void )section;
    
    if( section == 0 || [ [ MCPurchaseManager sharedInstance ] hasProVersion ] )
    {
        return 6;
    }
    
    return 0;
}

- ( UITableViewCell * )tableView: ( UITableView * )tableView cellForRowAtIndexPath: ( NSIndexPath * )indexPath
{
    UITableViewCell * cell;
    MCString          string;
    
    string = ( indexPath.section == 0 ) ? [ [ MCPreferences sharedInstance ] string1 ] : [ [ MCPreferences sharedInstance ] string2 ];
    cell   = [ tableView dequeueReusableCellWithIdentifier: __cellID ];
    
    if( cell == nil )
    {
        cell = [ [ [ UITableViewCell alloc ] initWithStyle: UITableViewCellStyleSubtitle reuseIdentifier: __cellID ] autorelease ];
    }
    
    switch( ( MCString )[ indexPath row ] )
    {
        case MCStringE1: cell.textLabel.text = L10N( "StringE1" ); break;
        case MCStringB:  cell.textLabel.text = L10N( "StringB" );  break;
        case MCStringG:  cell.textLabel.text = L10N( "StringG" );  break;
        case MCStringD:  cell.textLabel.text = L10N( "StringD" );  break;
        case MCStringA:  cell.textLabel.text = L10N( "StringA" );  break;
        case MCStringE2: cell.textLabel.text = L10N( "StringE2" ); break;
    }
    
    if( ( MCString )[ indexPath row ] == string )
    {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    else
    {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    cell.imageView.image     = [ [ UIImage imageNamed: @"Music" ] imageWithRenderingMode: UIImageRenderingModeAlwaysTemplate ];
    cell.imageView.tintColor = [ UIColor lightGrayColor ];
    
    return cell;
}

- ( NSString * )tableView: ( UITableView * )tableView titleForHeaderInSection: ( NSInteger )section
{
    ( void )tableView;
    
    if( section == 0 )
    {
        return L10N( "FirstString" );
    }
    else if( section == 1 )
    {
        return L10N( "SecondString" );
    }
    
    return @"";
}

- ( NSString * )tableView: ( UITableView * )tableView titleForFooterInSection: ( NSInteger )section
{
    ( void )tableView;
    
    if( section == 1 && [ [ MCPurchaseManager sharedInstance ] hasProVersion ] == NO )
    {
        return L10N( "SecondStringNotAvailable" );
    }
    
    return @"";
}

@end
