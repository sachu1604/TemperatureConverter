//
//  TemperatureViewController.m
//  TemperatureConverter
//
//  Created by Sachin  Shah on 7/29/13.
//  Copyright (c) 2013 Sachin  Shah. All rights reserved.
//

#import "TemperatureViewController.h"

@interface TemperatureViewController ()

@property Boolean textFieldF;

-(void)textBoxSelector;
-(void)calculateTemp;

@end

@implementation TemperatureViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        self.title=@"Temp Converter";
        //self.textFieldF=TRUE;
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    self.celsiusTextField.delegate=self;
    self.fahrenheitTextField.delegate=self;
    
    [self.fahrenheitTextField addTarget:self action:@selector(textBoxSelector) forControlEvents:UIControlEventEditingChanged];
    [self.celsiusTextField addTarget:self action:@selector(textBoxSelector) forControlEvents:UIControlEventEditingChanged];
    [self.convertButton addTarget:self action:@selector(calculateTemp) forControlEvents:UIControlEventTouchDown];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITextField Delegate
-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(onDoneButton)];
    return YES;
}

-(BOOL)textFieldShouldEndEditing:(UITextField *)textField{

    self.navigationItem.rightBarButtonItem=nil;
   // [self calculateTemp];
    return YES;
}

#pragma mark - Private Methods
-(void)textBoxSelector{
    
    if(self.fahrenheitTextField.isEditing){
    self.textFieldF=TRUE;
       // self.fahrenheitTextField.text=@"SELECTED";
       // self.celsiusTextField.text=@"";
    }
    else if (self.celsiusTextField.isEditing){
        self.textFieldF=FALSE;
       // self.fahrenheitTextField.text=@"";
       // self.celsiusTextField.text=@"SELECTED";

    }

}

-(void)calculateTemp{
    
    if(self.textFieldF==TRUE)
    {
        float fahren=[self.fahrenheitTextField.text floatValue];
        float cels=(fahren-32)*0.55555556;
        self.celsiusTextField.text=[NSString stringWithFormat: @"%0.2f",cels];
    }
    else
    {
        float cels=[self.celsiusTextField.text floatValue];
        float fahren=(cels*1.8)+32;
        self.fahrenheitTextField.text=[NSString stringWithFormat:@"%0.2f",fahren];
    }

  
}

-(void)onDoneButton{

    [self.view endEditing:YES];
  //  [self calculateTemp];

}
@end
