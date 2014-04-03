//
//  GTActionSheet.h
//  CustomizedActionSheet
//
//  Created by Gabriel Theodoropoulos.
//  Copyright (c) 2014 Gabriel Theodoropoulos. All rights reserved.
//
//  E-mail:     gabrielth.devel@gmail.com
//  Website:    http://gtiapps.com
//  Google+:    http://plus.google.com/+GabrielTheodoropoulos
//

#import <Foundation/Foundation.h>


typedef enum : NSUInteger {
    GTActionSheetIsPresent,
    GTActionSheetDidDismiss,
    GTActionSheetWillDismiss
} GTActionSheetState;


@interface GTActionSheet : NSObject <UIActionSheetDelegate>

-(id)initWithTitle:(NSString *)title delegate:(id<UIActionSheetDelegate>)delegate cancelButtonTitle:(NSString *)cancelButtonTitle destructiveButtonTitle:(NSString *)destructiveButtonTitle otherButtonTitles:(NSString *)otherButtonTitles, ... NS_REQUIRES_NIL_TERMINATION;

-(void)showInView:(UIView *)view withCompletionHandler:(void(^)(NSString *buttonTitle, NSInteger buttonIndex, GTActionSheetState actionSheetState))handler;

@end
