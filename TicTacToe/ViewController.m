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
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.yourTurn = YES;
    self.xArray = [NSMutableArray new];
    self.yArray = [NSMutableArray new];
        //[self.xArray addObject:[NSNumber numberWithInt:self.labelNine.tag]];
    NSLog(@"%@", self.xArray);
        //int *ra [8][3]= {{1,2,3},{4,5,6},{7,8,9}, {1,4,7}, {2,5,8}, {3, 6, 9}, {1, 5, 9}, {7, 5, 3}};
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
        //NSArray *arraysOfWinningCombinations = @[@[1, 2, 3], @[4, 5, 6], @[7, 8, 9], @[1, 4, 7], @[2, 5, 8], @[3, 6, 9], @[1, 5, 9] , @[7, 5, 3]];
        //NSArray *arraysOfWinningCombinations = [NSArray arrayWithArray:@[[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9] , [7, 5, 3]]];
        //int *ra [8][3]= {{1,2,3},{4,5,6},{7,8,9}, {1,4,7}, {2,5,8}, {3, 6, 9}, {1, 5, 9}, {7, 5, 3}};


    }
}


@end
