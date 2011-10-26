//
//  NCESpeaker.m
//  RestKitDemo
//
//  Created by Victor Jalencas on 26/10/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "NCESpeaker.h"

@implementation NCESpeaker

@synthesize speakerId, name, bio, photoURL;

- (void)dealloc;
{
    [speakerId release];
    [name release];
    [bio release];
    [photoURL release];
    [super dealloc];
}

@end
