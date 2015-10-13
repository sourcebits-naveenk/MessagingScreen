//
//  ViewController.m
//  MessagingScreen
//
//  Created by Naveen Katari on 08/10/15.
//  Copyright (c) 2015 Sourcebits. All rights reserved.
//

#import "ViewController.h"
#import "keyboardAnimation.h"

@interface ViewController ()
{
    NSMutableArray *messageDataArray;
    NSString *msg;
}

@end

@implementation ViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib.
    messageDataArray = [[NSMutableArray alloc]init];
    _messagingTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    
}

    
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (IBAction)editDidBegan:(id)sender
{
    [KeyboardAnimation textFieldDidBeginEditing:_messageTextField inView:self ];
}

- (IBAction)editDidEnd:(id)sender
{
    [KeyboardAnimation textFieldDidEndEditing:_messageTextField inView:self];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [messageDataArray count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *newCell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (newCell == nil)
    {
        newCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    [newCell.textLabel setText:[messageDataArray objectAtIndex:indexPath.row]];
    
    return newCell;
}


- (IBAction)sendButton:(id)sender
{
    [_messageTextField resignFirstResponder];
    msg = _messageTextField.text;
    NSLog(@"%@", msg);
    [messageDataArray addObject:msg];
    _messageTextField.text = @"";
    [_messagingTableView reloadData];
}
@end
