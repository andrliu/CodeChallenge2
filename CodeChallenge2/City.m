//
//  City.m
//  CodeChallenge2
//
//  Created by Andrew Liu on 10/30/14.
//  Copyright (c) 2014 Andrew Liu. All rights reserved.
//

#import "City.h"

@implementation City

- (NSURL *)wikiURL
{
    if (self.name == @"Los Angeles")
    {
        return @"http://en.wikipedia.org/wiki/Los_Angeles";
    }
    else if (self.name == @"San Francisco")
    {
        return @"http://en.wikipedia.org/wiki/San_Francisco";
    }
    else if (self.name == @"Seattle")
    {
        return @"http://en.wikipedia.org/wiki/seattle";
    }
    else if (self.name == @"Chicago")
    {
        return @"http://en.wikipedia.org/wiki/chicago";
    }
    return @"http://en.wikipedia.org/wiki/";
}

-(instancetype)initWithName:(NSString *)name withState:(NSString *)state withImage:(UIImage *)image;
{
    self = [super init];
    self.name = name;
    self.state = state;
    self.image = image;
    return self;
}

@end
