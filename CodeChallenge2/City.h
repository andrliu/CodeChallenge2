//
//  City.h
//  CodeChallenge2
//
//  Created by Andrew Liu on 10/30/14.
//  Copyright (c) 2014 Andrew Liu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol CityDelegate <NSObject>


@end

@interface City : NSObject
@property NSString *name;
@property NSString *state;
@property UIImage *image;
@property (weak, nonatomic) id <CityDelegate> delegate;

- (NSURL *)wikiURL;
-(instancetype)initWithName:(NSString *)name withState:(NSString *)state withImage:(UIImage *)image;

@end
