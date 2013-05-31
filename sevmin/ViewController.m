//
//  ViewController.m
//  sevmin
//
//  Created by Michael Sena on 5/30/13.
//  Copyright (c) 2013 Michael Sena. All rights reserved.
//

#import "ViewController.h"
#import "MASWorkout.h"
#import "MASExercise.h"
#import "UIImage+emoji.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *currentExerciseLabel;
@property (weak, nonatomic) IBOutlet UILabel *nextExerciseLabel;
@property (weak, nonatomic) IBOutlet UILabel *nextLabel;
@property (weak, nonatomic) IBOutlet UIImageView *picture;
@property (weak, nonatomic) IBOutlet UIButton *startButton;
@property (strong, nonatomic) MASWorkout *workout;
@property (strong, nonatomic) NSTimer *timer;
@property BOOL inCountdown;
@property BOOL inExercise;
@property BOOL inRest;
@end

@implementation ViewController
{
    int countdown,
        workoutIndex;
}

// Override Getter for workout Property so we can do
// Lazy-initialization
- (MASWorkout *)workout
{
    if (!_workout){
        _workout = [[MASWorkout alloc] initWithDefaultWorkout];
    }
    return _workout;
}

#pragma mark - View Controller Lifecycle
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self startingUI];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Interface Manipulation

#define CLOUDSCOLOR [UIColor colorWithRed:0.925 green:0.941 blue:0.945 alpha:1.0]
#define ALZARINCOLOR [UIColor colorWithRed:0.906 green:0.298 blue:0.235 alpha:1.0]
#define MIDNIGHTBLUECOLOR [UIColor colorWithRed:0.173 green:0.243 blue:0.314 alpha:1.0]
#define NEPHRITISCOLOR [UIColor colorWithRed:0.153 green:0.682 blue:0.376 alpha:1.0]
#define SUNFLOWERCOLOR [UIColor colorWithRed:0.945 green:0.769 blue:0.059 alpha:1.0]

- (void)startingUI
{
    self.currentExerciseLabel.hidden = YES;
    self.currentExerciseLabel.textColor = CLOUDSCOLOR;
    self.nextExerciseLabel.hidden = YES;
    self.nextExerciseLabel.textColor = CLOUDSCOLOR;
    self.nextLabel.hidden = YES;
    self.nextLabel.textColor = CLOUDSCOLOR;
    self.picture.backgroundColor = MIDNIGHTBLUECOLOR;
    self.startButton.titleLabel.textColor = CLOUDSCOLOR;
    self.startButton.hidden = NO;
    [self.startButton setTitle:@"Start" forState:UIControlStateNormal];
}

- (void)updateUI
{
    [self.startButton setTitle:[NSString stringWithFormat:@"%d", countdown]
                      forState:UIControlStateNormal];
    if (self.inCountdown) {
        self.nextExerciseLabel.text = [self.workout.exercises[workoutIndex] name];
        self.nextExerciseLabel.hidden = NO;
        self.nextLabel.hidden = NO;
    } else if (self.inExercise) {
        if (workoutIndex == 11) {
            self.currentExerciseLabel.text = [self.workout.exercises[workoutIndex] name];
            self.picture.image = [self.workout.exercises[workoutIndex] image];
            self.nextLabel.hidden = YES;
            self.nextExerciseLabel.hidden = YES;
            return;
        }
        self.currentExerciseLabel.hidden = NO;
        self.currentExerciseLabel.text = [self.workout.exercises[workoutIndex] name];
        self.picture.image = [self.workout.exercises[workoutIndex] image];
        self.nextExerciseLabel.text = [self.workout.exercises[workoutIndex+1] name];
    } else if (self.inRest) {
        self.currentExerciseLabel.text = @"REST";
    }
}

- (void)workoutUI
{
    [UIView animateWithDuration:1.0f
                          delay:0.0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         self.picture.backgroundColor = ALZARINCOLOR;
                     } completion:^(BOOL finished) {
                         
                     }];
}

- (void)restUI
{
    [UIView animateWithDuration:1.0f
                          delay:0.0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         self.picture.backgroundColor = MIDNIGHTBLUECOLOR;
                         self.picture.image = nil;
                     } completion:^(BOOL finished) {
                         
                     }];
}

- (void)doneUI
{
    self.startButton.hidden = YES;
    [UIView animateWithDuration:5.0f
                          delay:0.0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         self.picture.backgroundColor = SUNFLOWERCOLOR;
                         self.picture.image = [UIImage imageWithEmoji:@"👍" withSize:35.0f];
                         self.currentExerciseLabel.text = @"Done!";
                         
                     } completion:^(BOOL finished) {
                         [self startingUI];
                         self.picture.image = nil;
                     }];
}

#pragma mark - User Interaction

- (IBAction)startButtonPressed:(UIButton *)sender
{
    [self startCoundown];
}

#pragma mark - App Logic

- (void)startCoundown
{
    workoutIndex = 0;
    countdown = 3;
    self.inCountdown = YES;
    [self updateUI];
    countdown--;
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1
                                                  target:self
                                                selector:@selector(tick)
                                                userInfo:nil
                                                 repeats:YES];
}

#define EXERCISELENGTH 3
#define RESTLENGTH 2

- (void)tick
{
    if (self.inCountdown && (countdown == 0)) {
        self.inCountdown = NO;
        self.inExercise = YES;
        countdown = EXERCISELENGTH;
        [self workoutUI];
        [self updateUI];
        workoutIndex++;
    }
    
    if (self.inExercise && (countdown == 0)) {
        self.inExercise = NO;
        self.inRest = YES;
        countdown = RESTLENGTH;
        [self restUI];
        [self updateUI];
    }
    if (self.inRest && (countdown == 0)) {
        self.inRest = NO;
        self.inExercise = YES;
        countdown = EXERCISELENGTH;
        [self workoutUI];
        [self updateUI];
        workoutIndex++;
        if (workoutIndex == 12) {
            [self doneUI];
            [self.timer invalidate];
            return;
        }
    }
    [self updateUI];
    countdown--;
}

@end
