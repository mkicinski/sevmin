//
//  MASExercise.m
//  sevmin
//
//  Created by Michael Sena on 5/30/13.
//  Copyright (c) 2013 Michael Sena. All rights reserved.
//

#import "MASExercise.h"

@implementation MASExercise

// Designated Initializer, this does most of the work
- (id)initWithName:(NSString *)name
             image:(UIImage *)image
          twoSided:(BOOL)isTwoSided
{
    self = [super init];
    if (self) {
        [self setName:name];
        [self setImage:image];
        [self setTwoSided:isTwoSided];
    }
    return self;
}

- (id)init
{
    UIImage *defaultImage = [[UIImage alloc] initWithContentsOfFile:@"1.png"];
    return [self initWithName:@"Default Exercise"
                        image:defaultImage
                     twoSided:NO];
}

// Helper for logging
- (NSString *)description
{
    return [NSString stringWithFormat:@" Name: \"%@\"\ttwoSided: %@", self.name, self.twoSided ? @"YES" : @"NO"];
}

@end
