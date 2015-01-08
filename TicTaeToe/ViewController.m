//
//  ViewController.m
//  TicTaeToe
//
//  Created by Ryan  Gunn on 1/8/15.
//  Copyright (c) 2015 Ryan  Gunn. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UILabel *LabelOne;
@property (strong, nonatomic) IBOutlet UILabel *LabelTwo;
@property (strong, nonatomic) IBOutlet UILabel *LabelThree;
@property (strong, nonatomic) IBOutlet UILabel *LabelFour;
@property (strong, nonatomic) IBOutlet UILabel *LabelFive;
@property (strong, nonatomic) IBOutlet UILabel *LabelSix;
@property (strong, nonatomic) IBOutlet UILabel *LabelSeven;
@property (strong, nonatomic) IBOutlet UILabel *LabelEight;
@property (strong, nonatomic) IBOutlet UILabel *LabelNine;
@property (strong, nonatomic) IBOutlet UILabel *whichPlayerLabel;
@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray *labels;
@property NSString* player;
@property UIColor *playerColor;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.player = @"x";
    self.playerColor = [UIColor blueColor];
    self.whichPlayerLabel.text = @"PLAYER X";

}
- (IBAction)findLabelTapped:(UITapGestureRecognizer *)sender {
    CGPoint point = [sender locationInView:self.view];
    [self findLabelUsingPoint:point];




}


-(void) findLabelUsingPoint: (CGPoint)point{

    NSLog(@"%f, %f",point.x, point.y);

    for (UILabel* label in self.labels){
        if (CGRectContainsPoint(label.frame, point)) {
            label.text = self.player;
            label.textColor = self.playerColor;
            [self switchPlayer:label];
        }
    }






}
-(void)switchPlayer:(UILabel*)label{
    if ([self.player isEqualToString:@"x"]) {
        self.player = @"o";
        self.playerColor = [UIColor redColor];
        self.whichPlayerLabel.text = @"PLAYER O";



    }
    else
    {
        self.player= @"x";
        self.playerColor = [UIColor blueColor];
        self.whichPlayerLabel.text = @"PLAYER X";
        
        
    }
}

@end
