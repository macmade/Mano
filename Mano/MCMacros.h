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

#ifndef __MC_MACROS_H__
#define __MC_MACROS_H__

#define RELEASE_IVAR( _ivar_ )  [ _ivar_ release ]; _ivar_ = nil
#define L10N(  _name_ )         NSLocalizedString( @_name_, nil )
#define HEXCOLOR( c, a )        [ UIColor                                                                       \
                                    colorWithRed:   ( ( CGFloat )( ( c >> 16 ) & 0x0000FF ) ) / ( CGFloat )255  \
                                    green:          ( ( CGFloat )( ( c >>  8 ) & 0x0000FF ) ) / ( CGFloat )255  \
                                    blue:           ( ( CGFloat )( ( c       ) & 0x0000FF ) ) / ( CGFloat )255  \
                                    alpha:            ( CGFloat )a                                              \
                                ]

#define APPLICATION             ( ( UIApplication * )[ UIApplication sharedApplication ] )
#define DEFAULTS                ( ( NSUserDefaults * )[ NSUserDefaults standardUserDefaults ] )
#define NOTIFICATION_CENTER     ( ( NSNotificationCenter * )[ NSNotificationCenter defaultCenter ] )
#define BUNDLE                  ( ( NSBundle * )[ NSBundle mainBundle ] )

#endif /* __MC_MACROS_H__ */
