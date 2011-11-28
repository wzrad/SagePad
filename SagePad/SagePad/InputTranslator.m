//
//  InputTranslator.m
//  SagePad
//
//  Created by Matthew Cobb on 11/19/11.
//  Copyright 2011 UIC. All rights reserved.
//

#import "InputTranslator.h"
#import "Server.h"
#import "SagePadConstants.h"

@implementation InputTranslator

@synthesize pointerId;
@synthesize sageWidth;
@synthesize sageHeight;
@synthesize ftpPortNumber;

- (id)init
{    
    self = [super init];
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver:self 
                                                 selector:@selector(translatePointerConfiguration:) 
                                                     name:NOTIFY_INPUT
                                                   object:nil];
    }
    
    return self;
}

- (void)translatePointerConfiguration:(NSNotification *)notification {
    NSString *configurationString = ((Server *)[notification object]).inputFromStream;
    NSScanner *scanner = [NSScanner scannerWithString:configurationString];
    
    [scanner scanInt:&pointerId];
    [scanner scanInt:&sageWidth];
    [scanner scanInt:&sageHeight];
    [scanner scanInt:&ftpPortNumber];
    
    // send the notification, may have to attach the data in some manner
    [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFY_SAGE_CONFIG object:self];
}

- (void) dealloc {
    // If you don't remove yourself as an observer, the Notification Center
    // will continue to try and send notification objects to the deallocated
    // object.
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [super dealloc];
}

@end
