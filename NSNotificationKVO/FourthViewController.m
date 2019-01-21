//
//  FourthViewController.m
//  NSNotificationKVO
//
//  Created by Jun Oh on 2019-01-20.
//  Copyright © 2019 Jun Oh. All rights reserved.
//

#import "FourthViewController.h"
#import "CustomView.h"

@interface FourthViewController ()

@property (nonatomic) UIView* yellowView;
@property (nonatomic) CustomView* whiteView;

@end

@implementation FourthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor grayColor];
    
    CustomView* whiteView = [[CustomView alloc] initWithFrame:CGRectZero];
    whiteView.translatesAutoresizingMaskIntoConstraints = NO;
    whiteView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:whiteView];
    self.whiteView = whiteView;
    
    [NSLayoutConstraint constraintWithItem:whiteView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0].active = YES;
    [NSLayoutConstraint constraintWithItem:whiteView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0].active = YES;
    [NSLayoutConstraint constraintWithItem:whiteView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.7 constant:0].active = YES;
    [NSLayoutConstraint constraintWithItem:whiteView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:150].active = YES;
    
    UIView* yellowView = [[UIView alloc] initWithFrame:CGRectZero];
    yellowView.translatesAutoresizingMaskIntoConstraints = NO;
    yellowView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:yellowView];
    self.yellowView = yellowView;
    
    [NSLayoutConstraint constraintWithItem:yellowView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:80.0].active = YES;
    [NSLayoutConstraint constraintWithItem:yellowView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:60.0].active = YES;
    [NSLayoutConstraint constraintWithItem:yellowView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view.safeAreaLayoutGuide attribute:NSLayoutAttributeTop multiplier:1.0 constant:30.0].active = YES;
    [NSLayoutConstraint constraintWithItem:yellowView attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.view.safeAreaLayoutGuide attribute:NSLayoutAttributeLeading multiplier:1.0 constant:30.0].active = YES;
    
    [whiteView addObserver:self forKeyPath:NSStringFromSelector(@selector(point)) options:0 context:nil];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if (context == nil) {
        if([keyPath isEqualToString:NSStringFromSelector(@selector(point))]) {
            self.yellowView.transform = CGAffineTransformMakeTranslation(self.whiteView.point.x, self.whiteView.point.y);
            
        }
    } else {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
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
