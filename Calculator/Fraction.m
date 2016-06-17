//  Fraction.m
//  myproduct
//

#import "Fraction.h"

@implementation Fraction
@synthesize numerator, denominator;

-(void) print{
    NSLog(@"%i/%i", numerator, denominator);
}

- (NSString *) converToString {
    if (numerator == denominator) {
        if (numerator == 0) return @"0";
        else                return @"1";
    }
    else if (denominator == 1)
        return [NSString stringWithFormat:@"%i", numerator];
    else if (numerator > denominator) {
        int digit1, digit2;
        digit1 = numerator / denominator;
        digit2 = numerator % denominator;
        return [NSString stringWithFormat:@"%i:%i/%i", digit1, digit2, denominator];
    }
    else
        return [NSString stringWithFormat:@"%i/%i", numerator, denominator];
}

-(double) convertToNum{
    if (denominator != 0)  return (double) numerator / denominator;
    else                   return NAN;
}

-(void)setTo:(int)n over:(int)d {
    numerator = n;
    denominator = d;
}

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


-(void)reduce{
    int u = numerator;
    int v = denominator;
    int temp;
    
    while (v != 0) {
        temp = u % v;
        u = v;
        v = temp;
    }
    numerator /= u;
    denominator /= u;
}

@end
