//
//  CardMatchingGame.h
//  CardGame
//
//  Created by Kris on 14/8/17.
//  Copyright (c) 2014年 Bezalel Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"
#import "Card.h"

@interface CardMatchingGame : NSObject


- (instancetype)initWithCardCount: (NSUInteger)count
                        usingDeck:(Deck*)deck; // the designated initializer

- (void)chooseCardAtIndex:(NSUInteger)index;
- (Card*)cardAtIndex:(NSUInteger)index;

@property (nonatomic, readonly) NSInteger score;

@property (nonatomic) NSUInteger maxMatchingCards;

@property (nonatomic, readonly) NSArray *lastChosenCards;
@property (nonatomic, readonly) NSInteger lastScore;


@end
