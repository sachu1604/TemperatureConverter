//
//  TemperatureViewController.h
//  TemperatureConverter
//
//  Created by Sachin  Shah on 7/29/13.
//  Copyright (c) 2013 Sachin  Shah. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TemperatureViewController : UIViewController <UITextFieldDelegate>

@property (nonatomic,strong) IBOutlet UITextField *fahrenheitTextField;
@property (nonatomic,strong) IBOutlet UITextField *celsiusTextField;
@property (nonatomic,strong) IBOutlet UIButton *convertButton;

-(IBAction)onDoneButton;
@end
