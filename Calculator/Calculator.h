//
//  Calculator.h
//  myproduct
//
//  Created by MF839-009 on 2016. 6. 14..
//  Copyright © 2016년 MF839-009. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "Fraction.h"

@interface Calculator : NSObject
@property (strong, nonatomic) Fraction *operand1, *operand2, *accumulator;

- (void) clear;
- (Fraction *) performOperation:(char)op;
@end
