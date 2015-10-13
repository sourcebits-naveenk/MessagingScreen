//
//  ViewController.h
//  MessagingScreen
//
//  Created by Naveen Katari on 08/10/15.
//  Copyright (c) 2015 Sourcebits. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "keyboardAnimation.h"

@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITextField *txtFieldMessage;
@property (weak, nonatomic) IBOutlet UITableView *tableViewMessaging;
//@property (weak, nonatomic) IBOutlet UINavigationItem *navigationBarName;



@end

