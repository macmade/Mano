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

@interface MCStringViewController: MCViewController
{
@protected
    
    UITableView * _tableView;
}

@property( nonatomic, readwrite, retain ) IBOutlet UITableView * tableView;

@end
