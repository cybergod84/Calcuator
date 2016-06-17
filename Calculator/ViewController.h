//
//  ViewController.h
//  Calculator
//
//  Created by MF839-009 on 2016. 6. 15..
//  Copyright © 2016년 MF839-009. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InfoViewController.h"


@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *myOpButton;
@property (weak, nonatomic) IBOutlet UILabel *display;

- (IBAction)clickDigit:(id)sender;
- (IBAction)openInfoView:(id)sender;
- (IBAction)openNewView:(id)sender;
- (IBAction)unwindToViewController:(UIStoryboardSegue *)sender;

// 추가
-(void)processDigit:(int)digit;
-(void)processOp:(char)theOp;
-(void)storeFracPart;

// 산술 연산키
- (IBAction)clickPlus:(id)sender;
- (IBAction)clickMinus:(id)sender;
- (IBAction)clickMultiply:(id)sender;
- (IBAction)clickDivide:(id)sender;

// 기타키
- (IBAction)clickOver:(id)sender;
- (IBAction)clickEquals:(id)sender;
- (IBAction)clickClear:(id)sender;

- (IBAction) changeColor:(UIColor *) newColor;
@end

