//
//  MapViewController.m
//  BitMasterTest
//
//  Created by Daniil on 19.02.2020.
//  Copyright © 2020 Daniil. All rights reserved.
//

#import "MapViewController.h"

@import GoogleMaps;

@interface MapViewController ()

@property (weak, nonatomic) IBOutlet GMSMapView *mapView;

@end

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.mapView animateToCameraPosition:_camera];
    _marker.map = _mapView;
    [_mapView setSelectedMarker:_marker];
}

@end
