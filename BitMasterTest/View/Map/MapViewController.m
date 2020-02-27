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
    
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:_latitude longitude:_longitude zoom:3];
    [self.mapView animateToCameraPosition: camera];
    
    GMSMarker *marker = [[GMSMarker alloc] init];
    marker.position = CLLocationCoordinate2DMake(_latitude, _longitude);
    marker.icon = [self createImage:_markerTitle];
    marker.map = _mapView;
}

-(UIImage *)createImage:(NSString*)title{
    
    UIColor *color = [UIColor grayColor];
    NSString *string = [NSString stringWithFormat:@"%@", title];
    NSDictionary *attrs = @{ NSForegroundColorAttributeName : color };
    NSAttributedString *attrStr = [[NSAttributedString alloc] initWithString:string attributes:attrs];
    
    UIImage *image = [UIImage imageNamed:@"mapPin"];
    UIGraphicsBeginImageContext(image.size);
    [image drawInRect:CGRectMake(0,0,image.size.width,image.size.height)];
    
    CGRect rect = CGRectMake(20,10, image.size.width, image.size.height);
    [[UIColor whiteColor] set];
    [attrStr drawInRect:rect];
    UIImage *markerImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return markerImage;
}

@end
