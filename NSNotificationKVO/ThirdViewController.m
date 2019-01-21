//
//  ThirdViewController.m
//  NSNotificationKVO
//
//  Created by Jun Oh on 2019-01-20.
//  Copyright © 2019 Jun Oh. All rights reserved.
//

#import "ThirdViewController.h"

@interface ThirdViewController ()

@property (nonatomic) NSLayoutConstraint* whiteViewBottomConstraint;
@property (nonatomic) UITextField* textField;

@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor redColor];
    
    UIView* whiteView = [[UIView alloc] initWithFrame:CGRectZero];
    whiteView.translatesAutoresizingMaskIntoConstraints = NO;
    whiteView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:whiteView];
    
    [NSLayoutConstraint constraintWithItem:whiteView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0].active = YES;
    
    [NSLayoutConstraint constraintWithItem:whiteView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:300.0].active = YES;
    
    [NSLayoutConstraint constraintWithItem:whiteView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:150.0].active = YES;
    
    self.whiteViewBottomConstraint = [NSLayoutConstraint constraintWithItem:whiteView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view.safeAreaLayoutGuide attribute:NSLayoutAttributeBottom multiplier:1.0 constant:-20.0];
    self.whiteViewBottomConstraint.active = YES;
    
    UITextField* textField = [[UITextField alloc] initWithFrame:CGRectZero];
    textField.translatesAutoresizingMaskIntoConstraints = NO;
    [whiteView addSubview:textField];
    self.textField = textField;
    
    [NSLayoutConstraint constraintWithItem:textField attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:whiteView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0].active = YES;
    [NSLayoutConstraint constraintWithItem:textField attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:whiteView attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0].active = YES;
    [NSLayoutConstraint constraintWithItem:textField attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:whiteView attribute:NSLayoutAttributeWidth multiplier:0.9 constant:0].active = YES;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardShowed:) name:UIKeyboardWillChangeFrameNotification object:nil];
    
    UITapGestureRecognizer* tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(screenTapped:)];
    [self.view addGestureRecognizer:tapGesture];
}

- (void) dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void) screenTapped:(UITapGestureRecognizer *)gesture {
    [self.textField resignFirstResponder];
}

- (void) keyboardShowed:(NSNotification *)notification {
    NSValue* keyboardValue = notification.userInfo[UIKeyboardFrameEndUserInfoKey];
    if(self.view.frame.size.height == keyboardValue.CGRectValue.origin.y) {
        self.whiteViewBottomConstraint.constant += keyboardValue.CGRectValue.size.height;
    } else {
        self.whiteViewBottomConstraint.constant -= keyboardValue.CGRectValue.size.height;
    }
    
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
