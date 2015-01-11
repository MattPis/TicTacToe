//
//  ViewController.h
//  TicTaeToe
//
//  Created by Ryan  Gunn on 1/8/15.
//  Copyright (c) 2015 Ryan  Gunn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootViewController : UIViewController
@property NSArray* winningScores;

@property NSString* player;
@property UIColor *playerColor;
@property NSMutableArray *playerXArray;
@property NSMutableArray *playerOArray;

@property NSArray *winningPatterns;
@property int takenLabelAmmount;

@property int timerInt;
@property NSTimer *timer;

@end

