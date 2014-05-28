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


#import "MCStringViewController.h"
#import "MCStringViewController+UITableViewDelegate.h"
#import "MCStringViewController+UITableViewDataSource.h"

@implementation MCStringViewController

@synthesize tableView = _tableView;

- ( void )dealloc
{
    RELEASE_IVAR( _tableView );
    
    [ super dealloc ];
}

- ( void )viewDidLoad
{
    [ super viewDidLoad ];
    
    _tableView.delegate     = self;
    _tableView.dataSource   = self;
    
    self.navigationItem.title = L10N( "ChooseStrings" );
}

@end
