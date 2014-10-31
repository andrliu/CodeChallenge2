//
//  City.h
//  CodeChallenge2
//
//  Created by Andrew Liu on 10/30/14.
//  Copyright (c) 2014 Andrew Liu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface City : NSObject
@property NSString *name;
@property NSString *state;
@property UIImage *image;

-(instancetype)initWithName:(NSString *)name withState:(NSString *)state withImage:(UIImage *)image;

@end
