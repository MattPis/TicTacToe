//
//  ViewController.m
//  TicTaeToe
//
//  Created by Ryan  Gunn on 1/8/15.
//  Copyright (c) 2015 Ryan  Gunn. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()
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
@property (weak, nonatomic) IBOutlet UILabel *timerLabel;
;


@end

@implementation RootViewController

- (void)viewDidLoad {                   //create nessesery data and run game
    [super viewDidLoad];
    self.winningPatterns = [[NSMutableArray alloc] initWithObjects:@"123",@"456",@"789",@"147",@"258",@"369",@"159",@"357", nil];
    self.playerXArray = [[NSMutableArray alloc]init];
    self.playerOArray = [[NSMutableArray alloc]init];
    self.navigationController.navigationBarHidden =YES;
    self.timerLabel.textColor = [UIColor whiteColor];
    [self   resetGame];
}


-(void)resetGame{
    self.player = @"x";                         //reset player to x
    self.playerColor = [UIColor colorWithRed:(111/255.0) green:(133/255.0) blue:(197/255.0) alpha:1.0];
    self.whichPlayerLabel.textColor = self.playerColor;
    self.whichPlayerLabel.text = @"x";
    [self.playerOArray removeAllObjects];
    self.takenLabelAmmount =0;

 for (UILabel* label in self.labels){       //reset labels identity
     label.text = @"";
 }
    [self.timer invalidate];
    [self startTimer];
}


-(void)startTimer{              //timer method declaration
    self.timerInt=16;

    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(updateCountdown) userInfo:self repeats:YES];
}

-(void)updateCountdown{     //timer coundDown (runs every second after timer is started)
    self.timerInt -=1;
    self.timerLabel.text =[NSString stringWithFormat: @"Time to go :%i",self.timerInt];


    if(self.timerInt == 0){     //if runed out of time reset timer and switch player
        [self.timer invalidate];
        self.timerLabel.text = @"switching player";
        [self changePlayer];
    }
    else if (self.timerInt<4){     //change color of timer label when 3 seconds left
        self.timerLabel.textColor = [UIColor redColor];
    }
    else{
        self.timerLabel.textColor = [UIColor blackColor];
    }
}


- (IBAction)findLabelTapped:(UITapGestureRecognizer *)sender {  //pass parameter to findLabelUsing point when touched
    CGPoint point = [sender locationInView:self.view];
    [self findLabelUsingPoint:point];
}


-(void) findLabelUsingPoint: (CGPoint)point{
     //assigning label tapped to player x or o
    for (UILabel* label in self.labels){
        if ((CGRectContainsPoint(label.frame, point))&&([label.text isEqualToString:@"" ]&&([self.player  isEqual: @"x"]))) {

            //add label number to player x array
            [self.playerXArray addObject:[NSString stringWithFormat:@"%ld", (long)label.tag]];

            //code below overides tapped label for player identity
            label.text = self.player;
            label.textColor = self.playerColor;
            self.takenLabelAmmount ++;

            [self checkIfXwins];
        }
        else  if ((CGRectContainsPoint(label.frame, point))&&([label.text isEqualToString:@"" ]&&([self.player  isEqual: @"o"]))) {

            //add label number to player x array
            [self.playerOArray addObject:[NSString stringWithFormat:@"%ld", (long)label.tag]];
            
            //code below overides tapped label for player identity
            label.text = self.player;
            label.textColor = self.playerColor;
            self.takenLabelAmmount ++;

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
            self.takenLabelAmmount=0;
            [self.playerXArray removeAllObjects];
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
            }
        }
        if (localScore ==3){
            self.takenLabelAmmount=0;
            [self.playerXArray removeAllObjects];
            [self alertWinner:@"The Winner is O"];
        }
    }
    [self checkIfDraw];
}

-(void)checkIfDraw{

    if (self.takenLabelAmmount <9) {
        [self changePlayer];
    }
    else if (self.takenLabelAmmount==9)  {
        [self.playerXArray removeAllObjects];
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
    [self.timer invalidate];
    [self startTimer];

}
-(void)alertWinner: (NSString*)winnerName{
    NSString * message = [[NSString alloc]initWithFormat:@"%@",winnerName];
    UIAlertView* alert = [[UIAlertView alloc]initWithTitle:@"GAME OVER" message:message  delegate:self cancelButtonTitle:nil otherButtonTitles: @"Play Again",nil];

    self.timerLabel.text = @"GAME OVER";

    [alert show];
}
-(void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex{
    if (buttonIndex != alertView.cancelButtonIndex) {
        [self resetGame];
    }
}





@end
