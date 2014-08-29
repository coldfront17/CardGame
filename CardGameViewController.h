//
//  CardGameViewController.h
//  CardGame
//
//  Created by Kris on 14/8/28.
//  Copyright (c) 2014年 Bezalel Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CardGameViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *flipDescription;
@property (strong, nonatomic) NSMutableArray *flipHistory;

- (void)updateUI;

@end
