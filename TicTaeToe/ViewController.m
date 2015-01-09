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


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.winningScores = [NSArray arrayWithObjects:@"761",@"1193",@"1565",@"862",@"1189",@"1522",@"1191",@"1191", nil];

    [self   firstRound];
}
-(void)firstRound{
    self.player = @"x";
    self.playerColor = [UIColor blueColor];
    self.whichPlayerLabel.textColor = self.playerColor;
    self.whichPlayerLabel.text = @"x";
}

- (IBAction)findLabelTapped:(UITapGestureRecognizer *)sender {
    CGPoint point = [sender locationInView:self.view];
    [self findLabelUsingPoint:point];
}


-(void) findLabelUsingPoint: (CGPoint)point{

    int score = 0;
    for (UILabel* label in self.labels){
        if ((CGRectContainsPoint(label.frame, point))&&([label.text isEqualToString:@""])) {
            label.text = self.player;
            label.textColor = self.playerColor;
             score = label.center.x + label.center.y;
            NSLog(@"@%i",score);
        }
    }
    [self setScore:score];

}
-(void)setScore:(int)score{
    if ([self.player isEqualToString:@"x"]) {
        self.playerXScore += score;
    }
    else
    {
        self.playerOScore += score;
    }
    [self checkPlayerScore];
}

-(void)checkPlayerScore {
    for (NSNumber* enumScore in self.winningScores ) {

        //NSLog(@"%@ ",enumScore );

        if ( [enumScore integerValue] == self.playerXScore) {
       NSLog(@"player x won");
            [self alertWinner:@"x"];
        }

        else if ([enumScore integerValue]==self.playerOScore) {
            [self alertWinner:@"o"];
        }
    }
    [self changePlayer];

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
    UIAlertView* alert = [[UIAlertView alloc]initWithTitle:@"WINNER" message:message  delegate:self cancelButtonTitle:@"Next round" otherButtonTitles: nil];
    [alert show];

}




@end
