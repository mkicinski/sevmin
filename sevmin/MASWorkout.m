//
//  MASWorkout.m
//  sevmin
//
//  Created by Michael Sena on 5/30/13.
//  Copyright (c) 2013 Michael Sena. All rights reserved.
//

#import "MASWorkout.h"

@implementation MASWorkout

- (id)initWithExercises:(NSArray *)exercises
{
    self = [super init];
    if (self) {
        [self setExercises:[exercises copy]];
    }
    return self;
}

- (id)initWithDefaultWorkout
{
    return [self initWithExercises:[self defaultWorkout]];
}

- (id)initWithDefaultWorkoutReversed
{
    return [self initWithExercises:[[[self defaultWorkout] reverseObjectEnumerator] allObjects]];
}

- (NSString* )description
{
    NSString *descriptionString = @"";
    for (MASExercise *exercise in self.exercises) {
        descriptionString = [descriptionString stringByAppendingFormat:@"\n%@", [exercise description]];
    }
    return descriptionString;
}

// Generates the default workout as per the article in NYT
- (NSArray* )defaultWorkout
{
    NSMutableArray *defaultExercises = [[NSMutableArray alloc] init];
    MASExercise *jumpingJacks = [[MASExercise alloc] initWithName:@"Jumping Jacks"
                                                            image:[UIImage imageNamed:@"1.png"]
                                                         twoSided:NO];
    [defaultExercises addObject:jumpingJacks];
    MASExercise *wallSits = [[MASExercise alloc] initWithName:@"Wall Sits"
                                                            image:[UIImage imageNamed:@"2.png"]
                                                         twoSided:NO];
    [defaultExercises addObject:wallSits];
    MASExercise *pushUps = [[MASExercise alloc] initWithName:@"Push-ups"
                                                            image:[UIImage imageNamed:@"3.png"]
                                                         twoSided:NO];
    [defaultExercises addObject:pushUps];
    MASExercise *crunches = [[MASExercise alloc] initWithName:@"Abdominal Crunches"
                                                            image:[UIImage imageNamed:@"4.png"]
                                                         twoSided:NO];
    [defaultExercises addObject:crunches];
    MASExercise *stepUpOntoChair = [[MASExercise alloc] initWithName:@"Step-up onto Chair"
                                                            image:[UIImage imageNamed:@"5.png"]
                                                         twoSided:YES];
    [defaultExercises addObject:stepUpOntoChair];
    MASExercise *squats = [[MASExercise alloc] initWithName:@"Squats"
                                                            image:[UIImage imageNamed:@"6.png"]
                                                         twoSided:NO];
    [defaultExercises addObject:squats];
    MASExercise *dips = [[MASExercise alloc] initWithName:@"Tricep Dip on Cair"
                                                            image:[UIImage imageNamed:@"7.png"]
                                                         twoSided:NO];
    [defaultExercises addObject:dips];
    MASExercise *Plank = [[MASExercise alloc] initWithName:@"Planks"
                                                            image:[UIImage imageNamed:@"8.png"]
                                                         twoSided:NO];
    [defaultExercises addObject:Plank];
    MASExercise *highKnees = [[MASExercise alloc] initWithName:@"High Knees"
                                                            image:[UIImage imageNamed:@"9.png"]
                                                         twoSided:NO];
    [defaultExercises addObject:highKnees];
    MASExercise *lunges = [[MASExercise alloc] initWithName:@"Lunges"
                                                            image:[UIImage imageNamed:@"10.png"]
                                                         twoSided:NO];
    [defaultExercises addObject:lunges];
    MASExercise *pushUpAndRotate = [[MASExercise alloc] initWithName:@"Push Up and Rotation"
                                                            image:[UIImage imageNamed:@"11.png"]
                                                         twoSided:YES];
    [defaultExercises addObject:pushUpAndRotate];
    MASExercise *sidePlank = [[MASExercise alloc] initWithName:@"Side Plank"
                                                            image:[UIImage imageNamed:@"12.png"]
                                                         twoSided:YES];
    [defaultExercises addObject:sidePlank];
    
    return [defaultExercises copy];
}

@end
