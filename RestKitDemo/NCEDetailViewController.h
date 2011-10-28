//
//  NCEDetailViewController.h
//  RestKitDemo
//
//  Created by Victor Jalencas on 26/10/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MKMapView;
@class NCEEvent;

@interface NCEDetailViewController : UIViewController <UISplitViewControllerDelegate>

@property (strong, nonatomic) NCEEvent *detailItem;

@property (retain, nonatomic) IBOutlet UILabel *header;
@property (retain, nonatomic) IBOutlet UILabel *subTitle;
@property (retain, nonatomic) IBOutlet UILabel *date;
@property (retain, nonatomic) IBOutlet MKMapView *map;
@property (retain, nonatomic) IBOutlet UITextView *description;

@property (retain, nonatomic) IBOutlet UITableView *speakersTable;

@end
