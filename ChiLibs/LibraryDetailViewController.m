//
//  LibraryDetailViewController.m
//  ChiLibs
//
//  Created by Allan Evans on 7/9/16.
//  Copyright © 2016 - 2021 Allan Evans. All rights reserved.
//

#import "LibraryDetailViewController.h"
#import "NSString+AGE_LibraryHourFormatting.h"
#import <MapKit/MapKit.h>

@interface LibraryDetailViewController () <MKMapViewDelegate>

@property (weak, nonatomic) IBOutlet UITextView *libraryPhoneTextView;
@property (weak, nonatomic) IBOutlet UILabel *libraryAddressLabel;
@property (weak, nonatomic) IBOutlet UILabel *libraryHoursLabel;
@property (weak, nonatomic) IBOutlet MKMapView *libraryMapView;

@end

@implementation LibraryDetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = self.detailLibrary.branch;
    self.libraryPhoneTextView.text = [NSString stringWithFormat:@"Phone: %@", self.detailLibrary.phone];
    self.libraryAddressLabel.text = [NSString stringWithFormat:@"%@", self.detailLibrary.address];
    self.libraryHoursLabel.text = [self.detailLibrary.serviceHours formattedHours];
    [self annotateMap];
}

- (void)annotateMap
{
    CLLocationCoordinate2D zoomLocation;
    zoomLocation.latitude = [self.detailLibrary.location.latitude floatValue];
    zoomLocation.longitude = [self.detailLibrary.location.longitude floatValue];
    
    MKCoordinateSpan span;
    span.latitudeDelta = 0.01f;
    span.longitudeDelta = 0.01f;
    
    MKCoordinateRegion viewRegion;
    viewRegion.center = zoomLocation;
    viewRegion.span = span;
    
    MKPointAnnotation *point = [[MKPointAnnotation alloc] init];
    point.coordinate = zoomLocation;
    point.title = self.detailLibrary.branch;
    [self.libraryMapView addAnnotation:point];
    
    [self.libraryMapView setRegion:[self.libraryMapView regionThatFits:viewRegion] animated:YES];
}

@end
