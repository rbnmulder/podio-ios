//
//  POStreamActivityRatingData.h
//  PodioKit
//
//  Created by Sebastian Rehnby on 9/21/11.
//  Copyright 2011 Podio. All rights reserved.
//

#import "PKObjectData.h"

@interface PKReferenceRatingData : PKObjectData {
  
 @private
  NSInteger ratingId_;
  PKRatingType type_;
  id value_;
}

@property (nonatomic) NSInteger ratingId;
@property (nonatomic) PKRatingType type;
@property (nonatomic, copy) id value;

@end
