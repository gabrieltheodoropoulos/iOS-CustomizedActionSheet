//
//  GTActionSheet.m
//  CustomizedActionSheet
//
//  Created by Gabriel Theodoropoulos.
//  Copyright (c) 2014 Gabriel Theodoropoulos. All rights reserved.
//
//  E-mail:     gabrielth.devel@gmail.com
//  Website:    http://gtiapps.com
//  Google+:    http://plus.google.com/+GabrielTheodoropoulos
//

#import "GTActionSheet.h"

@interface GTActionSheet()

@property (nonatomic, strong) UIActionSheet *actionSheet;

@property (nonatomic, strong) void(^completionHandler)(NSString *, NSInteger, GTActionSheetState);

@end


@implementation GTActionSheet

-(id)initWithTitle:(NSString *)title
          delegate:(id<UIActionSheetDelegate>)delegate
 cancelButtonTitle:(NSString *)cancelButtonTitle
destructiveButtonTitle:(NSString *)destructiveButtonTitle
 otherButtonTitles:(NSString *)otherButtonTitles, ... NS_REQUIRES_NIL_TERMINATION{
    
    if (self = [super init]) {
        // Initialize the actionSheet property, but without the cancel and the other button titles.
        self.actionSheet = [[UIActionSheet alloc] initWithTitle:title
                                                   delegate:self
                                          cancelButtonTitle:nil
                                     destructiveButtonTitle:destructiveButtonTitle
                                          otherButtonTitles:nil];
        
        
        // Using the following snippet add the other button titles to the action sheet.
        // 1. Declare a local pointer to the other button titles list.
        va_list titlePointer;
        // 2. Point to the first item of the list.
        va_start(titlePointer, otherButtonTitles);
        // 3. Get the first button title.
        NSString *currentButtonTitle = otherButtonTitles;
        // 4. Make a loop while there are valid button titles.
        while (currentButtonTitle != nil) {
            // 5. Add the current button title to the action sheet.
            [_actionSheet addButtonWithTitle:currentButtonTitle];
            // 6. Get the next item of the titles list.
            currentButtonTitle = va_arg(titlePointer, NSString *);
        }
        // 7. Release the reserved memory.
        va_end(titlePointer);
        
        
        // Add the cancel button title as the last one added to the action sheet.
        [self.actionSheet addButtonWithTitle:cancelButtonTitle];
        [self.actionSheet setCancelButtonIndex:self.actionSheet.numberOfButtons - 1];
        
    }
    
    return self;
}


#pragma mark - Public method implementation

-(void)showInView:(UIView *)view withCompletionHandler:(void (^)(NSString *, NSInteger, GTActionSheetState))handler{
    // Store the completion handler to use it later.
    self.completionHandler = handler;
    
    // Show the action sheet.
    [self.actionSheet showInView:view];
}


#pragma mark - UIActionSheet Delegate method implementation

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    // Get the clicked button title.
    NSString *buttonTitle = [self.actionSheet buttonTitleAtIndex:buttonIndex];
    
    // Call the completion handler and provide the clicked button title and index.
    // In the state parameter indicate that the action sheet is present.
    self.completionHandler(buttonTitle, buttonIndex, GTActionSheetIsPresent);
}


-(void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex{
    // Get the clicked button title.
    NSString *buttonTitle = [self.actionSheet buttonTitleAtIndex:buttonIndex];
    
    // Call the completion handler and provide the clicked button title and index.
    // In the state parameter indicate that the action sheet did dismiss.
    self.completionHandler(buttonTitle, buttonIndex, GTActionSheetDidDismiss);
}


-(void)actionSheet:(UIActionSheet *)actionSheet willDismissWithButtonIndex:(NSInteger)buttonIndex{
    // Get the clicked button title.
    NSString *buttonTitle = [self.actionSheet buttonTitleAtIndex:buttonIndex];
    
    // Call the completion handler and provide the clicked button title and index.
    // In the state parameter indicate that the action sheet will dismiss.
    self.completionHandler(buttonTitle, buttonIndex, GTActionSheetWillDismiss);
}

@end
