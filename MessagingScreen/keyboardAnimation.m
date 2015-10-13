//
//  keyboardAnimation.m
//  MessagingScreen
//
//  Created by Naveen Katari on 09/10/15.
//  Copyright (c) 2015 Sourcebits. All rights reserved.
//

#import "keyboardAnimation.h"
#import <UIKit/UIKit.h>

@interface KeyboardAnimation ()
@end

@implementation KeyboardAnimation
static const CGFloat KEYBOARD_ANIMATION_DURATION = 0.3;

static const CGFloat MINIMUM_SCROLL_FRACTION = 0.2;

static const CGFloat MAXIMUM_SCROLL_FRACTION = 0.8;

static const CGFloat PORTRAIT_KEYBOARD_HEIGHT = 216;

static const CGFloat LANDSCAPE_KEYBOARD_HEIGHT = 162;

CGFloat animatedDistance;

/**
 *  Method for animaitng the keyboard
 *
 *  @param messagingTextField textfield object
 *  @param mainView           view controller object
 */
+ (void)textFieldDidBeginEditing:(UITextField *)messagingTextField inView:(UIViewController*)mainView
{
    
    CGRect textFieldRect =
    
    [ mainView.view.window convertRect:messagingTextField.bounds fromView:messagingTextField];
    
    CGRect viewRect =
    
    [mainView.view.window convertRect:mainView.view.bounds fromView:mainView.view];
    
    CGFloat midline = textFieldRect.origin.y + 0.5 * textFieldRect.size.height;
    
    CGFloat numerator =
    
    midline - viewRect.origin.y
    
    - MINIMUM_SCROLL_FRACTION * viewRect.size.height;
    
    CGFloat denominator =
    
    (MAXIMUM_SCROLL_FRACTION - MINIMUM_SCROLL_FRACTION)
    
    * viewRect.size.height;
    
    CGFloat heightFraction = numerator / denominator;
    
    if (heightFraction < 0.0)
        
    {
        
        heightFraction = 0.0;
        
    }
    
    else if (heightFraction > 1.0)
        
    {
        
        heightFraction = 1.0;
        
    }
    
    UIInterfaceOrientation orientation =
    
    [[UIApplication sharedApplication] statusBarOrientation];
    
    if (orientation == UIInterfaceOrientationPortrait ||
        
        orientation == UIInterfaceOrientationPortraitUpsideDown)
        
    {
        
        animatedDistance = floor(PORTRAIT_KEYBOARD_HEIGHT * heightFraction);
        
    }
    
    else
        
    {
        
        animatedDistance = floor(LANDSCAPE_KEYBOARD_HEIGHT * heightFraction);
        
    }
    
    CGRect viewFrame = mainView.view.frame;
    
    viewFrame.origin.y -= animatedDistance;
    
    
    
    [UIView beginAnimations:nil context:NULL];
    
    [UIView setAnimationBeginsFromCurrentState:YES];
    
    [UIView setAnimationDuration:KEYBOARD_ANIMATION_DURATION];
    
    
    
    [mainView.view setFrame:viewFrame];
    
    
    
    [UIView commitAnimations];
    
}



+ (void)textFieldDidEndEditing:(UITextField *)messagingTextfield inView:(UIViewController*)mainView
{
    
    
    
    CGRect viewFrame = mainView.view.frame;
    
    viewFrame.origin.y += animatedDistance;
    
    
    
    [UIView beginAnimations:nil context:NULL];
    
    [UIView setAnimationBeginsFromCurrentState:YES];
    
    [UIView setAnimationDuration:KEYBOARD_ANIMATION_DURATION];
    
    
    
    [mainView.view setFrame:viewFrame];
    
    
    
    [UIView commitAnimations];
}

@end

