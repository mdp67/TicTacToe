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
@property NSMutableArray *userArray;
@property NSMutableArray *computerArray;
@property NSString *whoWon;
@property NSArray *arrayOfLabels;
@property CGPoint whichPlayerLabelInitialPoint;
@property NSMutableArray *positionsAvailable;
@property NSNumber *numberOfPositionsRemaining;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.yourTurn = YES;
    self.userArray = [NSMutableArray new];
    self.computerArray = [NSMutableArray new];
    self.arrayOfLabels = @[self.labelOne, self.labelTwo, self.labelThree, self.labelFour, self.labelFive, self.labelSix, self.labelSeven, self.labelEight, self.labelNine];
    self.whichPlayerLabel.text = @"X";
    self.whichPlayerLabel.backgroundColor = [UIColor blueColor];
    self.whichPlayerLabelInitialPoint = self.whichPlayerLabel.center;
    self.positionsAvailable = [[NSMutableArray alloc] initWithObjects:@1, @2, @3, @4, @5, @6, @7, @8, @9, nil];
    self.numberOfPositionsRemaining = [[NSNumber alloc] initWithFloat:self.positionsAvailable.count] ;
}

-(BOOL) checkIfThreeNumberMatchWinnersInArray {

    NSArray *arraysOfWinningCombinations = @[@[@1, @2, @3], @[@4, @5, @6], @[@7, @8, @9], @[@1, @4, @7], @[@2, @5, @8], @[@3, @6, @9], @[@1, @5, @9] , @[@7, @5, @3]];
        // loop through each of the winning combination Array
    for (NSArray *arrayThatContainsWinners in arraysOfWinningCombinations) {
            // count how many numbers in the user array match each of the winning arrays
        int matchingNumberCheckInt = 0;
        NSArray *checkArray = [NSArray new];
        if (self.yourTurn) {
            checkArray = self.computerArray;
        } else {
            checkArray = self.userArray;
        }
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
        self.whichPlayerLabel.center = dragPoint;
    }

    if (sender.state == UIGestureRecognizerStateEnded) {
        CGPoint releasePoint = [sender locationInView:self.view];
        for (UILabel *label in self.arrayOfLabels) {
            if (CGRectContainsPoint(label.frame, releasePoint)) {
                [self play:label thePoint:releasePoint];
                self.whichPlayerLabel.center = self.whichPlayerLabelInitialPoint;
                return;
            }
        }
        [UIView animateWithDuration:0.5 animations:^{
            self.whichPlayerLabel.center = self.whichPlayerLabelInitialPoint;
        }];
    }
}

- (IBAction)onLabelTapped:(UITapGestureRecognizer *)sender {
    CGPoint point = [sender locationInView:self.view];
    for (UILabel *label in self.arrayOfLabels) {
        [self play:label thePoint:point];
    }
}

- (void) play:(UILabel *)label thePoint:(CGPoint) point {
    if (CGRectContainsPoint(label.frame, point) && label.enabled) {
        label.text = @"X";
        if (self.yourTurn) {
            label.text = @"X";
            label.backgroundColor = [UIColor blueColor];
            self.whichPlayerLabel.text = @"O";
            self.yourTurn = NO;
            self.whichPlayerLabel.backgroundColor = [UIColor redColor];
            NSNumber *addNumber = [[NSNumber alloc] initWithFloat:label.tag];
            [self.userArray addObject:addNumber];
        } else {
            label.text = @"O";
            label.backgroundColor = [UIColor redColor];
            self.whichPlayerLabel.text = @"X";
            self.yourTurn = YES;
            self.whichPlayerLabel.backgroundColor = [UIColor blueColor];
            NSNumber *addNumber = [[NSNumber alloc] initWithFloat:label.tag];
            [self.computerArray addObject:addNumber];
        }
        label.enabled = NO;
        NSNumber *removeNumber = [[NSNumber alloc] initWithFloat:label.tag];
        [self.positionsAvailable removeObject:removeNumber];
        NSLog(@"%@", self.positionsAvailable);

    }
    if ([self checkIfThreeNumberMatchWinnersInArray]) {
        NSString *alertViewTitle = [self.whoWon stringByAppendingString:@" won the Game!"];
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:alertViewTitle message:@"It was a great game" delegate:nil cancelButtonTitle:@"Play again?" otherButtonTitles:nil, nil];
        [alertView show];
        [self resetGame];
    }
    [self computerChoosePoint];

}

- (void) computerChoosePoint {
    if (self.yourTurn == NO) {
        NSLog(@"computer's turn");
    }
}

- (void) resetGame {
    for (UILabel *label in self.arrayOfLabels) {
        label.text = @"";
        label.backgroundColor = [UIColor lightGrayColor];
        label.enabled = TRUE;
    }
    self.whichPlayerLabel.backgroundColor = [UIColor blueColor];
    self.whichPlayerLabel.text = @"X";
    [self.userArray removeAllObjects];
    [self.computerArray removeAllObjects];
    self.yourTurn = YES;
}


    @end;
