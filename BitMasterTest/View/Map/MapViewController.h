//
//  MapViewController.h
//  BitMasterTest
//
//  Created by Daniil on 19.02.2020.
//  Copyright © 2020 Daniil. All rights reserved.
//

#import <UIKit/UIKit.h>

@import GoogleMaps;

NS_ASSUME_NONNULL_BEGIN

@interface MapViewController : UIViewController

@property GMSCameraPosition *camera;
@property GMSMarker *marker;

@end

NS_ASSUME_NONNULL_END
