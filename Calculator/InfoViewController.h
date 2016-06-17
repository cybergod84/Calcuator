//
//  InfoViewController.h
//  Calculator
//
//  Created by MF839-009 on 2016. 6. 16..
//  Copyright © 2016년 MF839-009. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol InfoViewProtocol <NSObject>
- (void) changeColor:(UIColor *) newColor;
@end

@interface InfoViewController : UIViewController
@property (nonatomic, weak) NSString * myString;

- (IBAction)close:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *myLabel;
@property (nonatomic, strong) id<InfoViewProtocol> delegate;
- (IBAction)changeColor:(id)sender;

@end
