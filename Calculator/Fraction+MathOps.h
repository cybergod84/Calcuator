//
//  Fraction+MathOps.h
//  myproduct
//
//  Created by MF839-009 on 2016. 6. 15..
//  Copyright © 2016년 MF839-009. All rights reserved.
//

#import "Fraction.h"

@interface Fraction (MathOps)
-(Fraction *)add:(Fraction *)f;
-(Fraction *)mul:(Fraction *)f;
-(Fraction *)sub:(Fraction *)f;
-(Fraction *)div:(Fraction *)f;
@end
