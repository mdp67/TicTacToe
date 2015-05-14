//
//  ViewController.m
//  TicTacToe
//
//  Created by Mark Porcella on 5/14/15.
//  Copyright (c) 2015 Mark Porcella. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *labelOne;
@property (weak, nonatomic) IBOutlet UILabel *labelTwo;
@property (weak, nonatomic) IBOutlet UILabel *labelThree;
@property (weak, nonatomic) IBOutlet UILabel *labelFour;
@property (weak, nonatomic) IBOutlet UILabel *labelFive;
@property (weak, nonatomic) IBOutlet UILabel *labelSix;
@property (weak, nonatomic) IBOutlet UILabel *labelSeven;
@property (weak, nonatomic) IBOutlet UILabel *labelEight;
@property (weak, nonatomic) IBOutlet UILabel *labelNine;
@property (weak, nonatomic) IBOutlet UILabel *whichPlayerLabel;
@property BOOL yourTurn;

@end






@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.yourTurn = YES;

}

- (void) findLabelUsingPoint:(CGPoint)point
{

}

- (IBAction)onLabelTapped:(UITapGestureRecognizer *)sender {
    CGPoint point = [sender locationInView:self.view];
    NSArray *arrayOfLabels = [NSArray arrayWithObjects:self.labelOne, self.labelTwo, self.labelThree, self.labelFour, self.labelFive, self.labelSix, self.labelSeven, self.labelEight, self.labelNine, nil];

    for (UILabel *label in arrayOfLabels) {
        if (CGRectContainsPoint(label.frame, point)) {
            label.text = @"X";
            if (self.yourTurn) {
                label.text = @"X";
                self.yourTurn = NO;
            } else {
                label.text = @"O";
                self.yourTurn = YES;
            }
        }

    }
}


@end
