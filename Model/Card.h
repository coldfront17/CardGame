//
//  Card.h
//  CardGame
//
//  Created by Kris on 14/8/14.
//  Copyright (c) 2014年 Bezalel Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (strong, nonatomic) NSString *contents;

@property (nonatomic, getter = isChosen) BOOL chosen;
@property (nonatomic, getter = isMatched) BOOL matched;

@property (nonatomic) NSUInteger numberOfMatchingCards;

- (int) match: (NSArray*)otherCards;

@end
