//
//  OutputTranslator.h
//  SagePad
//
//  Created by Matthew Cobb on 11/19/11.
//  Copyright 2011 UIC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AbstractOutputTranslator.h"

@interface OutputTranslator : NSObject <AbstractOutputTranslator> {
    NSString *pointerConfigurationNotification;
    
    NSInteger pointerId;
    NSInteger sageWidth;
    NSInteger sageHeight;
    NSInteger ftpPortNumber;
    
    BOOL sharePointer;
}

- (void)handlePointerConfiguration:(NSNotification *)notification;

@end
