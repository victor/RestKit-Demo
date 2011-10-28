//
//  NCEDetailViewController.m
//  RestKitDemo
//
//  Created by Victor Jalencas on 26/10/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "NCEDetailViewController.h"
#import <MapKit/MKMapView.h>
#import "NCEEvent.h"
#import <CoreLocation/CoreLocation.h>
#import "NCESpeaker.h"


@interface NCEDetailViewController ()
@property (strong, nonatomic) UIPopoverController *masterPopoverController;
- (void)configureView;
@end

@implementation NCEDetailViewController

@synthesize detailItem = _detailItem;
@synthesize header = _header;
@synthesize subTitle = _subTitle;
@synthesize date = _date;
@synthesize map = _map;
@synthesize description = _description;
@synthesize speakersTable = _speakersTable;
@synthesize masterPopoverController = _masterPopoverController;
@synthesize speakers;

- (void)dealloc
{
    [_detailItem release];
    [_masterPopoverController release];
    [_header release];
    [_subTitle release];
    [_date release];
    [_map release];
    [_description release];
    [_speakersTable release];
    [speakers release];
    [super dealloc];
}

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        [_detailItem release]; 
        _detailItem = [newDetailItem retain]; 

        // Update the view.
        [self configureView];
    }

    if (self.masterPopoverController != nil) {
        [self.masterPopoverController dismissPopoverAnimated:YES];
    }        
}

- (void)configureView
{
    // Update the user interface for the detail item.

    if (self.detailItem) {
        self.view.hidden = NO;
        self.header.text = [self.detailItem name];
        self.subTitle.text = [self.detailItem shortDescription];
        self.description.text = [self.detailItem fullDescription];
        self.date.text = [[self.detailItem startDate] description];
        self.map.centerCoordinate = CLLocationCoordinate2DMake(self.detailItem.latitude, self.detailItem.longitude);
        self.speakers = self.detailItem.speakers;
        self.speakersTable.delegate = self;
        self.speakersTable.dataSource = self;
        [self.speakersTable reloadData];
    } else {
        self.view.hidden = YES;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)viewDidUnload
{
    [self setHeader:nil];
    [self setSubTitle:nil];
    [self setDate:nil];
    [self setMap:nil];
    [self setDescription:nil];
    [self setSpeakersTable:nil];
    self.speakers = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return YES;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Detail", @"Detail");
    }
    return self;
}
							
#pragma mark - Split view

- (void)splitViewController:(UISplitViewController *)splitController willHideViewController:(UIViewController *)viewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)popoverController
{
    barButtonItem.title = NSLocalizedString(@"Master", @"Master");
    [self.navigationItem setLeftBarButtonItem:barButtonItem animated:YES];
    self.masterPopoverController = popoverController;
}

- (void)splitViewController:(UISplitViewController *)splitController willShowViewController:(UIViewController *)viewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    // Called when the view is shown again in the split view, invalidating the button and popover controller.
    [self.navigationItem setLeftBarButtonItem:nil animated:YES];
    self.masterPopoverController = nil;
}
// Mark: - Table view delegate & datasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    return [self.speakers count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"SpeakerCell";

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier] autorelease];
    }

    NCESpeaker *speaker = [speakers objectAtIndex:indexPath.row];
    
    cell.textLabel.text = speaker.name;
    cell.detailTextLabel.text = speaker.bio;
    cell.imageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[@"http://localhost:3000" stringByAppendingString:speaker.photoURL]]]];

    return cell;
}

@end
