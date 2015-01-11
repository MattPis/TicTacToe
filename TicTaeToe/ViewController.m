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
    self.winningPatterns = [[NSMutableArray alloc] initWithObjects:@"123",@"456",@"789",@"147",@"258",@"369",@"159",@"357", nil];
    self.playerXArray = [[NSMutableArray alloc]init];
    self.playerOArray = [[NSMutableArray alloc]init];
    [self   resetRound];
}


-(void)resetRound{
    self.player = @"x";
    self.playerColor = [UIColor colorWithRed:(111/255.0) green:(133/255.0) blue:(197/255.0) alpha:1.0];
    self.whichPlayerLabel.textColor = self.playerColor;
    self.whichPlayerLabel.text = @"x";
    self.takaenLabelsNr =0;
    [self.playerXArray removeAllObjects];
    [self.playerOArray removeAllObjects];


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
        if ((CGRectContainsPoint(label.frame, point))&&([label.text isEqualToString:@"" ]&&([self.player  isEqual: @"x"]))) {

            //add label number to player x array
            [self.playerXArray addObject:[NSString stringWithFormat:@"%ld", (long)label.tag]];

            //code below overides tapped label for player identity
            label.text = self.player;
            label.textColor = self.playerColor;
            self.takaenLabelsNr ++;
            [self checkIfXwins];

        }
        else  if ((CGRectContainsPoint(label.frame, point))&&([label.text isEqualToString:@"" ]&&([self.player  isEqual: @"o"]))) {

            //add label number to player x array
            [self.playerOArray addObject:[NSString stringWithFormat:@"%ld", (long)label.tag]];

            //code below overides tapped label for player identity
            label.text = self.player;
            label.textColor = self.playerColor;
            self.takaenLabelsNr ++;

            [self checkIfXwins];
            
        }


    }

}
-(void)checkIfXwins{
    int localScore = 0;

    for (NSString *winPatternFinder in self.winningPatterns){
        localScore = 0;

        for (NSString *playerScoreMatchNr in self.playerXArray) {

            if ([winPatternFinder containsString:playerScoreMatchNr]){
                localScore ++;
            }
        }

        if (localScore ==3){
            [self alertWinner:@"The Winner is X"];
        }
    }
    [self checkIfOwins];
   }


-(void)checkIfOwins{
    int localScore = 0;

    for (NSString *winPatternFinder in self.winningPatterns){
        localScore = 0;

        for (NSString *playerScoreMatchNr in self.playerOArray) {

            if ([winPatternFinder containsString:playerScoreMatchNr]){
                localScore ++;
                NSLog(@"adding score");
            }
        }

        if (localScore ==3){
            [self alertWinner:@"The Winner is O"];
        }
    }
    [self checkIfDraw];
}



-(void)checkIfDraw{

    if (self.takaenLabelsNr <9) {
        [self changePlayer];

    }
    else if (self.takaenLabelsNr ==9) {
        [self alertWinner:@"It's a Draw"];
    }

}


-(void)changePlayer{
    if ([self.player isEqualToString:@"x"]) {

        self.player = @"o";
        self.playerColor = [UIColor colorWithRed:(216/255.0) green:(78/255.0) blue:(39/255.0) alpha:1.0];
        self.whichPlayerLabel.text = @"o";
        self.whichPlayerLabel.textColor = self.playerColor;
    }
    else
    {
        self.player= @"x";
        self.playerColor = [UIColor colorWithRed:(111/255.0) green:(133/255.0) blue:(197/255.0) alpha:1.0];
        self.whichPlayerLabel.text = @"x";
        self.whichPlayerLabel.textColor = self.playerColor;
    }

}
-(void)alertWinner: (NSString*)winnerName{
    NSString * message = [[NSString alloc]initWithFormat:@"%@",winnerName];
    UIAlertView* alert = [[UIAlertView alloc]initWithTitle:@"GAME OVER" message:message  delegate:self cancelButtonTitle:nil otherButtonTitles: @"Play Again",nil];
    [alert show];

}
-(void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex{
    if (buttonIndex != alertView.cancelButtonIndex) {
        [self resetRound];
    }
}




@end
