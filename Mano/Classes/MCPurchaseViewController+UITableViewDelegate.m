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

#import "MCPurchaseViewController+UITableViewDelegate.h"

@implementation MCPurchaseViewController( UITableViewDelegate )

- ( void )tableView: ( UITableView * )tableView didSelectRowAtIndexPath: ( NSIndexPath * )indexPath
{
    [ tableView deselectRowAtIndexPath: indexPath animated: YES ];
}

@end
