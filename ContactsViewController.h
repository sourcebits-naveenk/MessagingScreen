//
//  ContactsViewController.h
//  MessagingScreen
//
//  Created by Naveen Katari on 13/10/15.
//  Copyright (c) 2015 Sourcebits. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"

@interface ContactsViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *contactsTableView;

@end
