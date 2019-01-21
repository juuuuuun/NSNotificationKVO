//
//  ViewController.m
//  NSNotificationKVO
//
//  Created by Jun Oh on 2019-01-20.
//  Copyright © 2019 Jun Oh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic) UIStepper* stepper;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor orangeColor];
    
    UILabel* controllerLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    controllerLabel.textAlignment = NSTextAlignmentCenter;
    controllerLabel.translatesAutoresizingMaskIntoConstraints = NO;
    controllerLabel.text = @"First View Controller";
    controllerLabel.font = [controllerLabel.font fontWithSize:32.0];

    [self.view addSubview:controllerLabel];
    
    [NSLayoutConstraint constraintWithItem:controllerLabel attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0].active = YES;
    [NSLayoutConstraint constraintWithItem:controllerLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view.safeAreaLayoutGuide attribute:NSLayoutAttributeTop multiplier:1.0 constant:20.0].active = YES;
    
    self.stepper = [[UIStepper alloc] initWithFrame:CGRectZero];
    self.stepper.translatesAutoresizingMaskIntoConstraints = NO;
    [self.stepper addTarget:self action:@selector(stepperStepped:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.stepper];
    
    [NSLayoutConstraint constraintWithItem:self.stepper attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0].active = YES;
    
    [NSLayoutConstraint constraintWithItem:self.stepper attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0].active = YES;
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"com.notificationkvo.stepperStepped" object:nil userInfo:@{@"stepper":@(self.stepper.value)}];
}

- (void) stepperStepped:(UIStepper *)sender {
    NSNotification* notification = [[NSNotification alloc] initWithName:@"com.notificationkvo.stepperStepped" object:nil userInfo:@{@"stepper":@(sender.value)}];
    
    [[NSNotificationCenter defaultCenter] postNotification:notification];
    
}

@end
