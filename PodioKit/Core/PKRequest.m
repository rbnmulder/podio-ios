//
//  PKRequest.m
//  PodioKit
//
//  Created by Sebastian Rehnby on 7/31/11.
//  Copyright (c) 2012 Citrix Systems, Inc. All rights reserved.
//

#import "PKRequest.h"
#import "PKObjectMapping.h"
#import "PKRequestOperation.h"
#import "PKRequestManager.h"

PKRequestMethod const PKRequestMethodGET = @"GET";
PKRequestMethod const PKRequestMethodPOST = @"POST";
PKRequestMethod const PKRequestMethodPUT = @"PUT";
PKRequestMethod const PKRequestMethodDELETE = @"DELETE";

@implementation PKRequest

@synthesize uri = uri_;
@synthesize method = method_;
@synthesize parameters = parameters_;
@synthesize body = body_;
@synthesize objectMapping = objectMapping_;
@synthesize objectDataPathComponents = objectDataPathComponents_;
@synthesize userInfo = userInfo_;
@synthesize scopePredicate = scopePredicate_;
@synthesize offset = offset_;
@synthesize mappingBlock = mappingBlock_;
@synthesize allowsConcurrent = allowsConcurrent_;
@synthesize requiresAuthenticated = requiresAuthenticated_;

- (id)initWithURI:(NSString *)uri method:(PKRequestMethod)method {
  self = [super init];
  if (self) {
    uri_ = [uri copy];
    method_ = [method copy];
    parameters_ = [[NSMutableDictionary alloc] init];
    body_ = nil;
    objectMapping_ = nil;
    objectDataPathComponents_ = nil;
    userInfo_ = nil;
    scopePredicate_ = nil;
    offset_ = 0;
    mappingBlock_ = nil;
    allowsConcurrent_ = YES;
    requiresAuthenticated_ = YES;
  }
  
  return self;
}

- (id)initWithURI:(NSString *)uri method:(PKRequestMethod)method objectMapping:(PKObjectMapping *)objectMapping {
  self = [self initWithURI:uri method:method];
  if (self) {
    objectMapping_ = objectMapping;
  }
  
  return self;
}


+ (PKRequest *)requestWithURI:(NSString *)uri method:(PKRequestMethod)method {
  return [[self alloc] initWithURI:uri method:method];
}

+ (PKRequest *)requestWithURI:(NSString *)uri method:(PKRequestMethod)method objectMapping:(PKObjectMapping *)objectMapping {
  return [[self alloc] initWithURI:uri method:method objectMapping:objectMapping];
}

- (PKRequestOperation *)startWithCompletionBlock:(PKRequestCompletionBlock)completionBlock {
  return [[PKRequestManager sharedManager] performRequest:self completion:completionBlock];
}

@end
