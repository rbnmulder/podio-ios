//
//  NSError+PKErrors.m
//  PodioKit
//
//  Created by Sebastian Rehnby on 11/14/11.
//  Copyright (c) 2011 Podio. All rights reserved.
//

#import "NSError+PKErrors.h"


NSString * const PKErrorStatusCodeKey = @"PKErrorStatusCodeKey";
NSString * const PKERrorResponseStringKey = @"PKERrorResponseStringKey";

@implementation NSError (PKErrors)

+ (NSError *)po_noConnectionError {
  NSMutableDictionary *userInfo = [[NSMutableDictionary alloc] init];
  [userInfo setObject:NSLocalizedString(@"You are not connected to the internet, please try again later.", nil) forKey:NSLocalizedDescriptionKey];
  
  NSError *error = [NSError errorWithDomain:kPodioKitErrorDomain code:PKErrorCodeNoConnection userInfo:userInfo];
  [userInfo release];
  
  return error;
}

+ (NSError *)po_responseParseError {
  NSMutableDictionary *userInfo = [[NSMutableDictionary alloc] init];
  [userInfo setObject:NSLocalizedString(@"Unable to read the server response.", nil) forKey:NSLocalizedDescriptionKey];
  
  NSError *error = [NSError errorWithDomain:kPodioKitErrorDomain code:PKErrorCodeParsingFailed userInfo:userInfo];
  [userInfo release];
  
  return error;
}

+ (NSError *)po_serverErrorWithStatusCode:(NSUInteger)statusCode responseString:(NSString *)responseString {
  NSMutableDictionary *userInfo = [[NSMutableDictionary alloc] init];
  [userInfo setObject:NSLocalizedString(@"A server error occurred.", nil) forKey:NSLocalizedDescriptionKey];
  [userInfo setObject:[NSNumber numberWithUnsignedInteger:statusCode] forKey:PKErrorStatusCodeKey];
  [userInfo setObject:responseString forKey:PKERrorResponseStringKey];
  
  NSError *error = [NSError errorWithDomain:kPodioKitErrorDomain code:PKErrorCodeServerError userInfo:userInfo];
  [userInfo release];
  
  return error;
}

@end