/* Copyright (c) 2016 Google Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#import "GMUFeature.h"

@implementation GMUFeature

@synthesize geometry = _geometry;
@synthesize style = _style;

- (instancetype)initWithGeometry:(id<GMUGeometry>)geometry
                      identifier:(NSString * _Nullable)identifier
                      properties:(NSDictionary<NSString *, NSObject *> * _Nullable)properties {
    if (self = [super init]) {
        _geometry = geometry;
        _identifier = identifier;
        _properties = properties ?: [[[NSDictionary alloc] init] copy];
    }
    return self;
}

- (instancetype)initWithGeometry:(id<GMUGeometry>)geometry
                      identifier:(NSString * _Nullable)identifier
                      properties:(NSDictionary<NSString *, NSObject *> * _Nullable)properties
                     boundingBox:(GMSCoordinateBounds * _Nullable)boundingBox {
  if (self = [super init]) {
    _geometry = geometry;
    _identifier = identifier;
    _boundingBox = boundingBox;
    _properties = properties ?: [[[NSDictionary alloc] init] copy];
  }
  return self;
}

- (instancetype)initWithGeometry:(id<GMUGeometry>)geometry
                      identifier:(NSString * _Nullable)identifier
                customProperties:(NSDictionary<NSString *, NSObject *> * _Nullable)customProperties
                      properties:(NSDictionary<NSString *, NSString *> * _Nullable)properties
                     boundingBox:(GMSCoordinateBounds * _Nullable)boundingBox {
    if (self = [super init]) {
        _geometry = geometry;
        _identifier = identifier;
        _customProperties = customProperties ?: [[[NSDictionary alloc] init] copy];
        _boundingBox = boundingBox;
        _properties = properties ?: [[[NSDictionary alloc] init] copy];
    }
    return self;
}

@end
