//
//  keyboardAnimation.h
//  MessagingScreen
//
//  Created by Naveen Katari on 09/10/15.
//  Copyright (c) 2015 Sourcebits. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface KeyboardAnimation : NSObject


+ (void)textFieldDidBeginEditing:(UITextField *)messagingTextField inView:(UIViewController*)mainView;



+ (void)textFieldDidEndEditing:(UITextField *)messagingTextfield inView:(UIViewController*)mainView;



@end
