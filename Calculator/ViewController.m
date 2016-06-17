//
//  ViewController.m
//  Calculator
//
//  Created by MF839-009 on 2016. 6. 15..
//  Copyright © 2016년 MF839-009. All rights reserved.
//

#import "ViewController.h"
#import "Calculator.h"
#import "InfoViewController.h"
#import "ThirdViewController.h"

@interface ViewController ()

@end

@implementation ViewController
{
    char op;
    int currentNumber;
    BOOL firstOperand, isNumerator, isNinus;
    Calculator *myCalculator;
    NSMutableString *displayString;
}
//@synthesize display;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _display.text   = @"";
    firstOperand    = YES;
    isNumerator     = YES;
    isNinus         = NO;
    displayString   = [NSMutableString stringWithCapacity: 40];
    myCalculator    = [Calculator new];
    
    [self setMyOpButtonEnabled:YES];
}

-(void)processDigit:(int)digit {
    currentNumber = currentNumber * 10 + digit;
    if (isNinus) {
        currentNumber *= -1;
        isNinus = NO;
    }
    
    [displayString appendString:[NSString stringWithFormat:@"%i", digit]];
    _display.text = displayString;
}

-(void)processOp:(char)theOp {
    NSString *opStr;
    
//    if (!firstOperand) return;
    op = theOp;
    switch (theOp) {
        case '+':
            opStr = @" + ";
            break;
        case '-':
            if(currentNumber == 0){
                isNinus = YES;
                opStr = @"-";
            }
            opStr = @" - ";
            break;
        case '*':
            opStr = @" * ";
            break;
        case '/':
            opStr = @" / ";
            break;
    }
    [displayString appendString:opStr];
    _display.text = displayString;

    if(currentNumber != 0) {
        [self storeFracPart];
        firstOperand = NO;
        isNumerator = YES;
        
        
        [self setMyOpButtonEnabled:NO];
    }
}

-(void)storeFracPart {
    if (firstOperand) {
        if (isNumerator) {
            myCalculator.operand1.numerator     = currentNumber;
            myCalculator.operand1.denominator   = 1;
        }
        else
            myCalculator.operand1.denominator   = currentNumber;
    }
    else {
        if (isNumerator){
            myCalculator.operand2.numerator     = currentNumber;
            myCalculator.operand2.denominator   = 1;
        }
        else {
            myCalculator.operand2.denominator   = currentNumber;
            firstOperand = YES;
        }
    }
    currentNumber = 0;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)clickPlus:(id)sender {
    [self processOp:'+'];
}

- (IBAction)clickMinus:(id)sender {
    [self processOp:'-'];
}

- (IBAction)clickMultiply:(id)sender {
    [self processOp:'*'];
}

- (IBAction)clickDivide:(id)sender {
    [self processOp:'/'];
}

- (IBAction)clickOver:(id)sender {
    [self storeFracPart];
    isNumerator = NO;
    [displayString appendString:@"/"];
    _display.text = displayString;
}

- (IBAction)clickEquals:(id)sender {
    if (firstOperand == NO) {
        [self storeFracPart];
        [myCalculator performOperation: op];
        
        [displayString appendString:@" = "];
        [displayString appendString:[myCalculator.accumulator converToString]];
        _display.text = displayString;
        
        currentNumber = 0;
        isNumerator = YES;
        firstOperand = YES;
        [displayString setString:@""];
        [self setMyOpButtonEnabled:YES];
    }
}

- (IBAction)clickClear:(id)sender {
    isNumerator = YES;
    firstOperand = YES;
    currentNumber = 0;
    [myCalculator clear];
    
    [displayString setString:@""];
    _display.text = displayString;
    
    [self setMyOpButtonEnabled:YES];
}

- (IBAction)openInfoView:(id)sender {
    InfoViewController *infoViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"infoview"];
    
    infoViewController.delegate = self;
    
    infoViewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    
    infoViewController.myString = self.display.text;
    
    [self presentViewController:infoViewController
                       animated:YES
                     completion:nil];
}

- (IBAction)openNewView:(id)sender {
    [self performSegueWithIdentifier:@"puppleview" sender:self];
}

- (IBAction)clickDigit:(UIButton *)sender {
    int digit = (int) sender.tag;
    
    [self processDigit:digit];
}

- (void) setMyOpButtonEnabled:(BOOL)val {
    for (int i = 0; i < self.myOpButton.count; i++) {
        UIButton *btn = [self.myOpButton objectAtIndex:i];
        btn.enabled = val;
    }
}

- (IBAction)unwindToViewController:(UIStoryboardSegue *)sender {
        NSLog(@"unwindToViewController");
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    NSLog(@"Segue ID = %@", segue.identifier);
    if ([segue.identifier isEqualToString: @"blueview"]) {
        InfoViewController *infoView = [segue destinationViewController];
        infoView.myString = @"Hello World";
    } else if ([segue.identifier isEqualToString:@"PUPPLEVIEW"]) {
        ThirdViewController *thirdView = [segue destinationViewController];
        [thirdView changeColorFunc:^(UIColor *newColor) {
            [self.view setBackgroundColor:newColor];
        }];
    }
}


- (IBAction) changeColor:(UIColor *)newColor {
    NSLog(@"Change Color!");
    [self.view setBackgroundColor: newColor];
}


@end
