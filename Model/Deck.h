//
//  Deck.h
//  CardGame
//
//  Created by Kris on 14/8/14.
//  Copyright (c) 2014年 Bezalel Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

@property (nonatomic) int cardCount;


- (void)addCard:(Card*)card atTop:(BOOL)atTop;
- (void)addCard:(Card*)card;

- (Card*)drawRandomCard;

@end
