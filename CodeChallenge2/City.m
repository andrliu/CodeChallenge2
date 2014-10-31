//
//  City.m
//  CodeChallenge2
//
//  Created by Andrew Liu on 10/30/14.
//  Copyright (c) 2014 Andrew Liu. All rights reserved.
//

#import "City.h"

@implementation City

- (void)wikiURL
{
    [self.delegate theCityURL:self.url];
}

- (instancetype)initWithName:(NSString *)name withState:(NSString *)state withImage:(UIImage *)image withURL:(NSString *)url
{
    self = [super init];
    self.name = name;
    self.state = state;
    self.image = image;
    self.url = url;
    return self;
}

@end
