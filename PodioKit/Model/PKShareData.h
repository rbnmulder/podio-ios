//
//  PKShareData.h
//  PodioKit
//
//  Created by Sebastian Rehnby on 3/13/12.
//  Copyright (c) 2012 Podio. All rights reserved.
//

#import "PKObjectData.h"

@interface PKShareData : PKObjectData

@property (nonatomic) NSUInteger appId;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *abstract;
@property (nonatomic, copy) NSString *icon;
@property (nonatomic) NSInteger rating;

@end
