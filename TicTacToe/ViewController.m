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
@property NSMutableArray *xArray;
@property NSMutableArray *yArray;
@property NSMutableArray *toCheck;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.yourTurn = YES;
    self.xArray = [NSMutableArray new];

    // for checking delete later

//    [self.xArray addObject:@3];
//    [self.xArray addObject:@2];
//    [self.xArray addObject:@1];
    self.yArray = [NSMutableArray new];

    self.toCheck = [NSMutableArray new];

  //  [self checkIfThreeObjectsMatchBetweenTwoArrays];
}

-(void)checkIfThreeNumberMatchWinnersInArray {

    NSArray *arraysOfWinningCombinations = @[@[@1, @2, @3], @[@4, @5, @6], @[@7, @8, @9], @[@1, @4, @7], @[@2, @5, @8], @[@3, @6, @9], @[@1, @5, @9] , @[@7, @5, @3]];

    for (NSArray *arrayThatContainsWinners in arraysOfWinningCombinations) {
        int matchingNumberCheckInt = 0;
        NSArray *checkArray = [NSArray new];
        if (self.yourTurn) {
            checkArray = self.yArray;
        } else {
            checkArray = self.xArray;
        }

        for (NSNumber *numberInPlayerArray in checkArray) {
            if ([arrayThatContainsWinners containsObject:numberInPlayerArray]) {
                matchingNumberCheckInt++;
                NSLog(@"%i", matchingNumberCheckInt);
                if (matchingNumberCheckInt == 3) {
                    if (self.yourTurn) {
                        NSLog(@"You suck");
                        return;
                    } else {
                        NSLog(@"you just won the game");
                        return;
                    }

                }
            }
        }
    }
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
                label.backgroundColor = [UIColor blueColor];
                self.whichPlayerLabel.text = @"O";
                self.yourTurn = NO;
                [self.xArray addObject:[NSNumber numberWithInt:label.tag]];
                NSLog(@"X array %@",self.xArray);
            } else {
                label.text = @"O";
                label.backgroundColor = [UIColor redColor];
                self.whichPlayerLabel.text = @"X";
                self.yourTurn = YES;
                [self.yArray addObject:[NSNumber numberWithInt:label.tag]];
                NSLog(@"Y array %@",self.yArray);
            }
        }
        [self checkIfThreeNumberMatchWinnersInArray];

    }
}


@end
