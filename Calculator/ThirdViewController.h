//
//  ThirdViewController.h
//  Calculator
//
//  Created by MF839-009 on 2016. 6. 17..
//  Copyright © 2016년 MF839-009. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ThirdViewController : UIViewController
{
    void(^changeMainBackColor)(UIColor *);
}

@property void(^newChangeMainBackColor)(UIColor *);

- (IBAction)changeColor:(id)sender;

- (void)changeColorFunc:(void(^)(UIColor *)) myFunc;

@end
