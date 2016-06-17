//
//  Fraction+MathOps.m
//  myproduct
//
//  Created by MF839-009 on 2016. 6. 15..
//  Copyright © 2016년 MF839-009. All rights reserved.
//

#import "Fraction+MathOps.h"

@implementation Fraction (MathOps)

-(Fraction *)add:(Fraction *)f {
    Fraction  *result = [Fraction new];
    
    result.numerator = (numerator * f.denominator) + (denominator * f.numerator);
    result.denominator = denominator * f.denominator;
    [result reduce];
    
    return result;
}

-(Fraction *)mul:(Fraction *)f {
    Fraction  *result = [Fraction new];
    result.numerator = self.numerator * f.numerator;
    result.denominator = self.denominator * f.denominator;
    [result reduce];
    
    return result;
}

-(Fraction *)sub:(Fraction *)f {
    Fraction  *result = [Fraction new];
    result.numerator = (self.numerator * f.denominator) - (self.denominator * f.numerator);
    result.denominator = self.denominator * f.denominator;
    [result reduce];
    
    return result;
}

-(Fraction *)div:(Fraction *)f {
    Fraction  *result = [Fraction new];
    result.numerator = self.numerator * f.denominator;
    result.denominator = self.denominator * f.numerator;
    [result reduce];
    
    return result;
}

@end
