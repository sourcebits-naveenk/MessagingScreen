//
//  ContactsViewController.m
//  MessagingScreen
//
//  Created by Naveen Katari on 13/10/15.
//  Copyright (c) 2015 Sourcebits. All rights reserved.
//

#import "ContactsViewController.h"

@interface ContactsViewController ()
{
    NSArray *contacts;
}

@end

@implementation ContactsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
     contacts = @[@"Naveen", @"Rajesh", @"Harish", @"Suman", @"Charan", @"Kiran", @"Sunawan"];
     _contactsTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    /**
     *  Return number of sections
     */
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [contacts count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *contactsTableIdentifier = @"ContactsTableCell";
    
    UITableViewCell *cell = (UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:contactsTableIdentifier];

    cell.textLabel.text = [contacts objectAtIndex:indexPath.row];
    //cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
   /* if ([segue.identifier isEqualToString:@"displayContactDetail"])
    {
        NSIndexPath *indexPath = [self.contactsTableView indexPathForSelectedRow];
        ViewController *destViewController = segue.destinationViewController;
        //destViewController.navigationBarName.title = [contacts objectAtIndex:indexPath.row];
       
    }*/
}


@end
