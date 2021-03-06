//
//  PKCoreDataMappingCoordinator.h
//  PodioKit
//
//  Created by Sebastian Rehnby on 9/14/11.
//  Copyright (c) 2012 Citrix Systems, Inc. All rights reserved.
//

#import <CoreData/CoreData.h>
#import "PKMappingCoordinator.h"
#import "PKObjectMapper.h"
#import "PKMappingProvider.h"


@interface PKCoreDataMappingCoordinator : PKMappingCoordinator <PKObjectMapperDelegate> {

 @private
  NSManagedObjectContext *managedObjectContext_;
}

@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;

- (id)initWithManagedObjectContext:(NSManagedObjectContext *)managedObjectContext 
                   mappingProvider:(PKMappingProvider *)mappingProvider;

@end
