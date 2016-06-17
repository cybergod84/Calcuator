//
//  Fraction.h
//  myproduct
//
//  Created by MF839-009 on 2016. 6. 13..
//  Copyright © 2016년 MF839-009. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Fraction : NSObject
{
    int numerator, denominator;
}
@property int numerator, denominator;
- (void) setTo:(int)n over:(int)d;
- (Fraction *)add:(Fraction *)f;
- (Fraction *)mul:(Fraction *)f;
- (Fraction *)sub:(Fraction *)f;
- (Fraction *)div:(Fraction *)f;
- (void) reduce;
- (void) print;
- (double) convertToNum;
- (NSString *) converToString;
@end
