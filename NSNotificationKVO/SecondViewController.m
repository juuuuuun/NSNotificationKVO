//
//  SecondViewController.m
//  NSNotificationKVO
//
//  Created by Jun Oh on 2019-01-20.
//  Copyright © 2019 Jun Oh. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@property (nonatomic) UILabel* countLabel;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor yellowColor];
    
    UILabel* controllerLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    controllerLabel.textAlignment = NSTextAlignmentCenter;
    controllerLabel.translatesAutoresizingMaskIntoConstraints = NO;
    controllerLabel.text = @"Second View Controller";
    controllerLabel.font = [controllerLabel.font fontWithSize:32.0];
    
    [self.view addSubview:controllerLabel];
    
    [NSLayoutConstraint constraintWithItem:controllerLabel attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0].active = YES;
    [NSLayoutConstraint constraintWithItem:controllerLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view.safeAreaLayoutGuide attribute:NSLayoutAttributeTop multiplier:1.0 constant:20.0].active = YES;
    
   
    
    //[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(stepperReceived:) name:@"com.notificationkvo.stepperStepped" object:nil];
    
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.countLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        self.countLabel.textAlignment = NSTextAlignmentCenter;
        self.countLabel.translatesAutoresizingMaskIntoConstraints = NO;
        //    self.countLabel.text = @"Count";
        self.countLabel.font = [self.countLabel.font fontWithSize:32.0];
        
        [self.view addSubview:self.countLabel];
        
        [NSLayoutConstraint constraintWithItem:self.countLabel attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0].active = YES;
        
        [NSLayoutConstraint constraintWithItem:self.countLabel attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0].active = YES;
         [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(stepperReceived:) name:@"com.notificationkvo.stepperStepped" object:nil];
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    
    
}

- (void) dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void) stepperReceived:(NSNotification *)notification {
    NSNumber* stepperValue = notification.userInfo[@"stepper"];
    self.countLabel.text = [NSString stringWithFormat:@"%.f", stepperValue.doubleValue];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
