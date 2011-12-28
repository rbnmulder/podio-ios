//
//  PKDefaultObjectFactory.h
//  PodioKit
//
//  Created by Sebastian Rehnby on 10/12/11.
//  Copyright (c) 2011 Podio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PKObjectRepository.h"

@interface PKDefaultObjectRepository : NSObject <PKObjectRepository>

+ (id)repository;

@end
