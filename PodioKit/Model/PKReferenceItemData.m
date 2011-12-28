//
//  PKReferenceItemData.m
//  PodioKit
//
//  Created by Sebastian Rehnby on 12/7/11.
//  Copyright (c) 2011 Podio. All rights reserved.
//

#import "PKReferenceItemData.h"


static NSString * const PKStreamItemDataItemId = @"ItemId";
static NSString * const PKStreamItemDataTitle = @"Title";
static NSString * const PKStreamItemDataAppName = @"AppName";
static NSString * const PKStreamItemDataAppItemName = @"AppItemName";

@implementation PKReferenceItemData

@synthesize itemId = itemId_;
@synthesize title = title_;
@synthesize appName = appName_;
@synthesize appItemName = appItemName_;

- (id)initWithCoder:(NSCoder *)aDecoder {
  self = [super initWithCoder:aDecoder];
  if (self) {
    itemId_ = [aDecoder decodeIntegerForKey:PKStreamItemDataItemId];
    title_ = [[aDecoder decodeObjectForKey:PKStreamItemDataTitle] copy];
    appName_ = [[aDecoder decodeObjectForKey:PKStreamItemDataAppName] copy];
    appItemName_ = [[aDecoder decodeObjectForKey:PKStreamItemDataAppItemName] copy];
  }
  return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
  [super encodeWithCoder:aCoder];
  [aCoder encodeInteger:itemId_ forKey:PKStreamItemDataItemId];
  [aCoder encodeObject:title_ forKey:PKStreamItemDataTitle];
  [aCoder encodeObject:appName_ forKey:PKStreamItemDataAppName];
  [aCoder encodeObject:appItemName_ forKey:PKStreamItemDataAppItemName];
}

- (void)dealloc {
  [appItemName_ release];
  [appName_ release];
  [title_ release];
  [super dealloc];
}

#pragma mark - Factory methods

+ (id)dataFromDictionary:(NSDictionary *)dict {
  PKReferenceItemData *data = [self data];
  
  data.itemId = [[dict pk_objectForKey:@"item_id"] integerValue];
  data.title = [dict pk_objectForKey:@"title"];
  
  NSDictionary *appDict = [dict pk_objectForKey:@"app"];
  data.appName = [appDict pk_objectForKey:@"name"];
  data.appItemName = [appDict pk_objectForKey:@"item_name"];
  
  return data;
}

@end