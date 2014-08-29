//
//  SetCard.h
//  CardGame
//
//  Created by Kris on 14/8/28.
//  Copyright (c) 2014年 Bezalel Inc. All rights reserved.
//

#import "Card.h"

@interface SetCard : Card

@property (strong, nonatomic) NSString *color;
@property (strong, nonatomic) NSString *symbol;
@property (strong, nonatomic) NSString *shading;
@property (nonatomic) NSUInteger number;

+ (NSArray *)validColors;
+ (NSArray *)validSymbols;
+ (NSArray *)validShadings;
+ (NSUInteger)maxNumber;

+ (NSArray *)cardsFromText:(NSString *)text;

@end
