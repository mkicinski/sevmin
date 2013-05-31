//
//  MASWorkout.h
//  sevmin
//
//  Created by Michael Sena on 5/30/13.
//  Copyright (c) 2013 Michael Sena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MASExercise.h"

@interface MASWorkout : NSObject

@property (nonatomic, strong) NSMutableArray* exercises; // of MASExercise

- (id)initWithExercises:(NSArray *)exercises;
- (id)initWithDefaultWorkout;
- (id)initWithDefaultWorkoutReversed;

@end
