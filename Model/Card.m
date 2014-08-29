//
//  Card.m
//  CardGame
//
//  Created by Kris on 14/8/14.
//  Copyright (c) 2014年 Bezalel Inc. All rights reserved.
//

#import "Card.h"

@implementation Card

- (int) match:(NSArray *)otherCards
{
    int score = 0;
    for (Card *card in otherCards) {
        if ([card.contents isEqualToString:self.contents]) {
            score = 1;
        }
    }
    return score;
}


- (NSUInteger)numberOfMatchingCards
{
    if (!_numberOfMatchingCards) _numberOfMatchingCards = 2;
    return _numberOfMatchingCards;
}



@end
