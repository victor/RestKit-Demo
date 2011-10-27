//
//  NCEEvent.h
//  RestKitDemo
//
//  Created by Victor Jalencas on 26/10/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NCEEvent : NSObject


@property (nonatomic, retain) NSString *eventId;
@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *shortDescription;
@property (nonatomic, retain) NSString *fullDescription;
@property (nonatomic, retain) NSDate *startDate;
@property (nonatomic, retain) NSString *location;
@property (nonatomic, retain) NSString *latitude;
@property (nonatomic, retain) NSString *longitude;
@property (nonatomic, retain) NSArray *speakers;

@end
