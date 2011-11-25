//
//  NetworkingService.m
//  SagePad
//
//  Created by Matthew Cobb on 11/23/11.
//  Copyright 2011 UIC. All rights reserved.
//

#import "NetworkingService.h"
#import "Server.h"
#import "InputTranslator.h"
#import "OutputTranslator.h"

@implementation NetworkingService

- (id)initWithIp:(NSString *)_ip withPortNumber:(NSInteger)_portNumber 
        withInputTranslator:(id<AbstractInputTranslator>)_inputTranslator
        withOutputTranslator:(id<AbstractOutputTranslator>)_outputTranslator {
    
    self = [super init];
    if (self) {
        server = [[Server alloc] initWithIp:_ip andPortNumber:_portNumber];
        inputTranslator = _inputTranslator;
        outputTranslator = _outputTranslator;
    }
    
    return self;
}

- (void)dealloc {
    [server release];
    [super dealloc];
}

- (void)startServer {
    [server startWithInputTranslator:inputTranslator andOutputTranslator:outputTranslator]; 
}

- (void)stopServer {
    [server stop];
}

@end