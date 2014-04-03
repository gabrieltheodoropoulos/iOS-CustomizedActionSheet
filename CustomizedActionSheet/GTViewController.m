//
//  GTViewController.m
//  CustomizedActionSheet
//
//  Created by Gabriel Theodoropoulos.
//  Copyright (c) 2014 Gabriel Theodoropoulos. All rights reserved.
//
//  E-mail:     gabrielth.devel@gmail.com
//  Website:    http://gtiapps.com
//  Google+:    http://plus.google.com/+GabrielTheodoropoulos
//

#import "GTViewController.h"
#import "GTActionSheet.h"


@interface GTViewController ()

@property (nonatomic, strong) GTActionSheet *actionSheet;

@end

@implementation GTViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showActionSheet:(id)sender {
    self.actionSheet = [[GTActionSheet alloc] initWithTitle:@"Pick a number"
                                                   delegate:nil
                                          cancelButtonTitle:@"Cancel"
                                     destructiveButtonTitle:@"Delete All"
                                          otherButtonTitles:@"One", @"Two", @"Three", @"Four", @"Five", nil];
    
    [self.actionSheet showInView:self.view
           withCompletionHandler:^(NSString *buttonTitle, NSInteger buttonIndex, GTActionSheetState actionSheetState) {

               if (actionSheetState == GTActionSheetIsPresent) {
                   NSString *message = [NSString stringWithFormat:@"Button index: #%d\n\nTitle: %@", buttonIndex, buttonTitle];
                   
                   UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"GTActionSheet"
                                                                   message:message
                                                                  delegate:nil
                                                         cancelButtonTitle:nil
                                                         otherButtonTitles:@"Okay", nil];
                   
                   [alert show];
               }
               else if (actionSheetState == GTActionSheetWillDismiss){
                   NSLog(@"Action sheet will dismiss.");
               }
               else{
                   NSLog(@"Action sheet did dismiss.");
               }
               
           }];
}

@end
