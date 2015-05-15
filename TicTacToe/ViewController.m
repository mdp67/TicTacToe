//
//  ViewController.m
//  TicTacToe
//
//  Created by Mark Porcella on 5/14/15.
//  Copyright (c) 2015 Mark Porcella. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIGestureRecognizerDelegate>

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
@property NSMutableArray *xArray;
@property NSMutableArray *yArray;
@property NSString *whoWon;
@property NSArray *arrayOfLabels;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.yourTurn = YES;
    self.xArray = [NSMutableArray new];
    self.yArray = [NSMutableArray new];
    self.arrayOfLabels = @[self.labelOne, self.labelTwo, self.labelThree, self.labelFour, self.labelFive, self.labelSix, self.labelSeven, self.labelEight, self.labelNine];
    self.whichPlayerLabel.text = @"X";
    self.whichPlayerLabel.backgroundColor = [UIColor blueColor];
}

-(BOOL) checkIfThreeNumberMatchWinnersInArray {

    NSArray *arraysOfWinningCombinations = @[@[@1, @2, @3], @[@4, @5, @6], @[@7, @8, @9], @[@1, @4, @7], @[@2, @5, @8], @[@3, @6, @9], @[@1, @5, @9] , @[@7, @5, @3]];
        // loop through each of the winning combination Array
    for (NSArray *arrayThatContainsWinners in arraysOfWinningCombinations) {
            // count how many numbers in the user array match each of the winning arrays
        int matchingNumberCheckInt = 0;
        NSArray *checkArray = [NSArray new];
        if (self.yourTurn) {
            checkArray = self.yArray;
        } else {
            checkArray = self.xArray;
        }
        NSLog(@" check array %@", checkArray);
        for (NSNumber *numberInPlayerArray in checkArray) {
            if ([arrayThatContainsWinners containsObject:numberInPlayerArray]) {
                matchingNumberCheckInt++;
                if (matchingNumberCheckInt == 3) {
                    if (self.yourTurn) {
                        self.whoWon = @"The Computer";
                        return YES;
                    } else {
                        self.whoWon = @"You";
                        return YES;
                    }
                }
            }
        }
    }
    return NO;
}
- (IBAction)onXODrag:(UIPanGestureRecognizer *)sender {
    CGPoint dragPoint = [sender locationInView:self.view];

    if (CGRectContainsPoint(self.whichPlayerLabel.frame, dragPoint)) {
        NSLog(@"Dragging into the point");
    }

}

- (IBAction)onLabelTapped:(UITapGestureRecognizer *)sender {
    CGPoint point = [sender locationInView:self.view];

    for (UILabel *label in self.arrayOfLabels) {
        if (CGRectContainsPoint(label.frame, point) && label.enabled) {
            label.text = @"X";
            if (self.yourTurn) {
                label.text = @"X";
                label.backgroundColor = [UIColor blueColor];
                self.whichPlayerLabel.text = @"O";
                self.yourTurn = NO;
                [self.xArray addObject:[NSNumber numberWithInt:label.tag]];
                //NSLog(@"X array %@",self.xArray);
                NSLog(@"got here");
            } else {
                label.text = @"O";
                label.backgroundColor = [UIColor redColor];
                self.whichPlayerLabel.text = @"X";
                self.yourTurn = YES;
                [self.yArray addObject:[NSNumber numberWithInt:label.tag]];
                //NSLog(@"Y array %@",self.yArray);
            }
            label.enabled = NO;
        }
    }
    if ([self checkIfThreeNumberMatchWinnersInArray]) {
        NSString *alertViewTitle = [self.whoWon stringByAppendingString:@" won the Game!"];
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:alertViewTitle message:@"It was a great game" delegate:nil cancelButtonTitle:@"Play again?" otherButtonTitles:nil, nil];
        [alertView show];
        [self resetAllLabels];
    }
}

- (void) play:(UILabel *)label thePoint:(CGPoint) point {



}

- (void) resetAllLabels {
    for (UILabel *label in self.arrayOfLabels) {
        label.text = @"";
        label.backgroundColor = [UIColor lightGrayColor];
    }
}


    @end;
