//
//  PKReferenceAlertData.h
//  PodioKit
//
//  Created by Sebastian Rehnby on 12/7/11.
//  Copyright (c) 2011 Podio. All rights reserved.
//

#import "PKObjectData.h"

@interface PKReferenceAlertData : PKObjectData {
  
 @private
  NSString *text_;
}

@property (nonatomic, copy) NSString *text;

@end
