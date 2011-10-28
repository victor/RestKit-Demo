//
//  NCEEvent.m
//  RestKitDemo
//
//  Created by Victor Jalencas on 26/10/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "NCEEvent.h"

@implementation NCEEvent

@synthesize eventId, name, shortDescription, fullDescription, startDate, location, latitude, longitude, speakers;


- (void)dealloc;
{
    [eventId release];
    [name release];
    [shortDescription release];
    [fullDescription release];
    [startDate release];
    [location release];
  //  [latitude release];
  //  [longitude release];
    [speakers release];
    [super dealloc];
}

@end
