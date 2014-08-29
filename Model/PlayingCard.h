//
//  PlayingCard.h
//  CardGame
//
//  Created by Kris on 14/8/14.
//  Copyright (c) 2014年 Bezalel Inc. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card

@property (strong, nonatomic) NSString *suit;
@property (nonatomic) NSUInteger rank;

+ (NSArray*)validSuits;
+ (NSUInteger)maxRank;

@end
