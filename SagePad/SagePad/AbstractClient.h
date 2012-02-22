//
//  AbstractClient.h
//  SagePad
//
//  Created by Jakub Misterka on 11/22/11.
//  Copyright 2011 UIC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AbstractInputTranslator.h"
#import "AbstractOutputTranslator.h"

@protocol AbstractClient <NSObject>

@required
- (id)initWithIp:(NSString *)_ipAddress andPortNumber:(NSInteger)_portNumber;
- (void)sendOutputString:(NSNotification *)notification;

- (void)start;
- (void)stop;
    
@optional
- (void)setBufferSize:(NSInteger)_bufferSize;

@end