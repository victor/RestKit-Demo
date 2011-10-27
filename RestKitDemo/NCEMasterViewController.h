//
//  NCEMasterViewController.h
//  RestKitDemo
//
//  Created by Victor Jalencas on 26/10/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class NCEDetailViewController;

#import <CoreData/CoreData.h>
#import <RestKit/RestKit.h>


@interface NCEMasterViewController : UITableViewController <NSFetchedResultsControllerDelegate,RKObjectLoaderDelegate>

@property (strong, nonatomic) NCEDetailViewController *detailViewController;

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@property (retain, nonatomic) NSArray *events;

- (void)fetchEvents;
@end
