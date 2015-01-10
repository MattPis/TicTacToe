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
@property (strong, nonatomic) IBOutletCollection(UILabel) NSMutableArray *labels;
;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self   resetRound];
}


-(void)resetRound{
    self.player = @"x";
    self.playerColor = [UIColor blueColor];
    self.whichPlayerLabel.textColor = self.playerColor;
    self.whichPlayerLabel.text = @"x";
    self.playerXScore = 0;
    self.playerOScore = 0;
 for (UILabel* label in self.labels){
     label.text = @"";
 }
}


- (IBAction)findLabelTapped:(UITapGestureRecognizer *)sender {
    CGPoint point = [sender locationInView:self.view];
    [self findLabelUsingPoint:point];

    
}


-(void) findLabelUsingPoint: (CGPoint)point{


    for (UILabel* label in self.labels){
        if ((CGRectContainsPoint(label.frame, point))&&([label.text isEqualToString:@"" ])) {
            label.text = self.player;
            label.textColor = self.playerColor;

        }
    }
    [self checkIfXwins];
}
    -(void)checkIfXwins{
    if([self.LabelOne.text isEqualToString:@"x"]&&[self.LabelTwo.text isEqualToString:@"x"]&&[self.LabelThree.text isEqualToString:@"x"]){
        [self alertWinner:@"x"];
    } else if([self.LabelOne.text isEqualToString:@"x"]&&[self.LabelFour.text isEqualToString:@"x"]&&[self.LabelSeven.text isEqualToString:@"x"]){
        [self alertWinner:@"x"];
    }else if([self.LabelOne.text isEqualToString:@"x"]&&[self.LabelFive.text isEqualToString:@"x"]&&[self.LabelNine.text isEqualToString:@"x"]){
        [self alertWinner:@"x"];
    }else if([self.LabelOne.text isEqualToString:@"x"]&&[self.LabelFive.text isEqualToString:@"x"]&&[self.LabelNine.text isEqualToString:@"x"]){
        [self alertWinner:@"x"];
    }else if([self.LabelTwo.text isEqualToString:@"x"]&&[self.LabelFive.text isEqualToString:@"x"]&&[self.LabelEight.text isEqualToString:@"x"]){
        [self alertWinner:@"x"];
    }else if([self.LabelThree.text isEqualToString:@"x"]&&[self.LabelFive.text isEqualToString:@"x"]&&[self.LabelSeven.text isEqualToString:@"x"]){
        [self alertWinner:@"x"];
    }else if([self.LabelThree.text isEqualToString:@"x"]&&[self.LabelSix.text isEqualToString:@"x"]&&[self.LabelNine.text isEqualToString:@"x"]){
        [self alertWinner:@"x"];
    }else if([self.LabelFour.text isEqualToString:@"x"]&&[self.LabelFive.text isEqualToString:@"x"]&&[self.LabelSix.text isEqualToString:@"x"]){
        [self alertWinner:@"x"];
    }else if([self.LabelSeven.text isEqualToString:@"x"]&&[self.LabelEight.text isEqualToString:@"x"]&&[self.LabelNine.text isEqualToString:@"x"]){
        [self alertWinner:@"x"];
    }else {
        [self checkIfOwins];    }

}

-(void)checkIfOwins{
    if([self.LabelOne.text isEqualToString:@"o"]&&[self.LabelTwo.text isEqualToString:@"o"]&&[self.LabelThree.text isEqualToString:@"o"]){
        [self alertWinner:@"o"];
    } else if([self.LabelOne.text isEqualToString:@"o"]&&[self.LabelFour.text isEqualToString:@"o"]&&[self.LabelSeven.text isEqualToString:@"o"]){
        [self alertWinner:@"o"];
    }else if([self.LabelOne.text isEqualToString:@"o"]&&[self.LabelFive.text isEqualToString:@"o"]&&[self.LabelNine.text isEqualToString:@"o"]){
        [self alertWinner:@"o"];
    }else if([self.LabelOne.text isEqualToString:@"o"]&&[self.LabelFive.text isEqualToString:@"o"]&&[self.LabelNine.text isEqualToString:@"o"]){
        [self alertWinner:@"o"];
    }else if([self.LabelTwo.text isEqualToString:@"o"]&&[self.LabelFive.text isEqualToString:@"o"]&&[self.LabelEight.text isEqualToString:@"o"]){
        [self alertWinner:@"o"];
    }else if([self.LabelThree.text isEqualToString:@"o"]&&[self.LabelFive.text isEqualToString:@"o"]&&[self.LabelSeven.text isEqualToString:@"o"]){
        [self alertWinner:@"o"];
    }else if([self.LabelThree.text isEqualToString:@"o"]&&[self.LabelSix.text isEqualToString:@"o"]&&[self.LabelNine.text isEqualToString:@"o"]){
        [self alertWinner:@"o"];
    }else if([self.LabelFour.text isEqualToString:@"o"]&&[self.LabelFive.text isEqualToString:@"o"]&&[self.LabelSix.text isEqualToString:@"o"]){
        [self alertWinner:@"o"];
    }else if([self.LabelSeven.text isEqualToString:@"o"]&&[self.LabelEight.text isEqualToString:@"o"]&&[self.LabelNine.text isEqualToString:@"o"]){
        [self alertWinner:@"o"];
    }else {
        [self checkIfDraw];    }

}
-(void)checkIfDraw{
    int usedLabels =0;
    for (UILabel *label in self.labels) {
        if (![label.text isEqualToString:@""]) {
            NSLog(@"option one");
            usedLabels++;
        }
        else{
            NSLog(@"option Two");
        }
    }
    
    if (usedLabels ==9) {
        [self alertWinner:@"draw"];
    }
    else {
       [self changePlayer];

    }


}


-(void)changePlayer{
    if ([self.player isEqualToString:@"x"]) {

        self.player = @"o";
        self.playerColor = [UIColor redColor];
        self.whichPlayerLabel.text = @"o";
        self.whichPlayerLabel.textColor = self.playerColor;
    }
    else
    {
        self.player= @"x";
        self.playerColor = [UIColor blueColor];
        self.whichPlayerLabel.text = @"x";
        self.whichPlayerLabel.textColor = self.playerColor;
    }

}
-(void)alertWinner: (NSString*)winnerName{
    NSString * message = [[NSString alloc]initWithFormat:@"The winner is:%@",winnerName];
    UIAlertView* alert = [[UIAlertView alloc]initWithTitle:@"WINNER" message:message  delegate:self cancelButtonTitle:nil otherButtonTitles: @"START OVER",nil];
    [alert show];

}
-(void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex{
    if (buttonIndex != alertView.cancelButtonIndex) {
        [self resetRound];
    }
}




@end
