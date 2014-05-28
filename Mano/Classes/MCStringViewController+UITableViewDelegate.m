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

#import "MCStringViewController+UITableViewDelegate.h"
#import "MCPreferences.h"

@implementation MCStringViewController( UITableViewDelegate )

- ( void )tableView: ( UITableView * )tableView didSelectRowAtIndexPath: ( NSIndexPath * )indexPath
{
    MCString string;
    
    [ tableView deselectRowAtIndexPath: indexPath animated: YES ];
    
    string = ( MCString )( indexPath.row );
    
    if( indexPath.section == 0 )
    {
        [ [ MCPreferences sharedInstance ] setString1: string ];
    }
    else
    {
        [ [ MCPreferences sharedInstance ] setString2: string ];
    }
    
    [ tableView reloadData ];
}

@end
