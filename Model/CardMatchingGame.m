//
//  CardMatchingGame.m
//  CardGame
//
//  Created by Kris on 14/8/17.
//  Copyright (c) 2014年 Bezalel Inc. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()
@property (nonatomic, readwrite) NSInteger score;
@property (nonatomic, strong) NSMutableArray *candidateCards; // of card

@property (nonatomic, strong) NSArray *lastChosenCards;
@property (nonatomic, readwrite) NSInteger lastScore;

@end



@implementation CardMatchingGame

- (NSMutableArray*)candidateCards
{
    if (!_candidateCards) _candidateCards = [[NSMutableArray alloc]init];
    return _candidateCards;
}


- (instancetype)initWithCardCount:(NSUInteger)count
                        usingDeck:(Deck *)deck
{
    self = [super init];
    
    if (self) {
        for (int i=0; i<count; i++) {
            Card *card = [deck drawRandomCard];
            if (card) {
                [self.candidateCards addObject:card]; //for protection, don't add nil
            } else {
                self = nil;
                break;
            }
            
            
        }
    }
    
    return self;
}

static const    int MISMATCH_PENALTY = 2;
static const    int MATCH_BONUS = 4;
static const    int COST_TO_CHOOSE = 1;

- (void)chooseCardAtIndex:(NSUInteger)index
{
    Card *card = [self cardAtIndex:index];
    
    if (!card.isMatched) {
        if (card.isChosen) {
            card.chosen = NO;
        } else {
            NSMutableArray *otherCards = [NSMutableArray array];
            for (Card *otherCard in self.candidateCards) {
                if (otherCard.isChosen && !otherCard.isMatched) {
                    [otherCards addObject:otherCard];
                }
            }
            
            self.lastScore = 0;
            self.lastChosenCards = [otherCards arrayByAddingObject:card];
            
            if ([otherCards count] + 1 == self.maxMatchingCards) {
                int matchScore = [card match:otherCards];
                if (matchScore) {
                    self.lastScore = matchScore * MATCH_BONUS;
                    card.matched = YES;
                    for (Card *otherCard in otherCards) {
                        otherCard.matched = YES;
                    }
                } else {
                    self.lastScore = - MISMATCH_PENALTY;
                    for (Card *otherCard in otherCards) {
                        otherCard.chosen = NO;
                    }
                }
            }
            self.score += self.lastScore - COST_TO_CHOOSE;
            card.chosen = YES;
        }
    }

    
}





- (Card*)cardAtIndex:(NSUInteger)index
{
    return (index<[self.candidateCards count]) ? self.candidateCards[index] : nil;
}





- (NSUInteger)maxMatchingCards
{
    Card *card = [self.candidateCards firstObject];
    if (_maxMatchingCards < card.numberOfMatchingCards) {
        _maxMatchingCards = card.numberOfMatchingCards;
    }
    return _maxMatchingCards;
}










@end
