//
//  MASExercise.h
//  sevmin
//
//  Created by Michael Sena on 5/30/13.
//  Copyright (c) 2013 Michael Sena. All rights reserved.
//

// An MASExcercise represents a single exercise that occurs
// during a workout. It is comprised of a descriptive name
// and image. A series of MASExercises makeup a workout
#import <Foundation/Foundation.h>

@interface MASExercise : NSObject

@property (nonatomic, strong) NSString* name;
@property (nonatomic, strong) UIImage* image;
@property BOOL twoSided;

// Designated Initializer
- (id)initWithName:(NSString *)name
             image:(UIImage *)image
          twoSided:(BOOL)isTwoSided;


@end
