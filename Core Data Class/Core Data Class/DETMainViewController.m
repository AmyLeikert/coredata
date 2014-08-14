//
//  DETMainViewController.m
//  Core Data Class
//
//  Created by Thomas Crawford on 4/30/13.
//  Copyright (c) 2013 Thomas Crawford. All rights reserved.
//

#import "DETMainViewController.h"
#import "DETAppDelegate.h"
#import "Contacts.h"
#import "Orders.h"

@interface DETMainViewController ()

@property (strong, nonatomic) NSArray                *contactArray;
@property (strong, nonatomic) IBOutlet UILabel       *recordCountLabel;
@property (strong, nonatomic) IBOutlet UILabel       *recordNameLabel;

@end

@implementation DETMainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Interactivity Methods

- (DETAppDelegate *)getAppDelegate {
    UIApplication *sharedApp = [UIApplication sharedApplication];
    DETAppDelegate *appDelegate = [sharedApp delegate];
    return appDelegate;
}

- (IBAction)fetchRecordsPressed:(id)sender {
    NSLog(@"Fetch...");
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Contacts" inManagedObjectContext:_managedObjectContext];
    [fetchRequest setEntity:entity];
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"lastName" ascending:YES];
    NSArray *sortDescriptors = [[NSArray alloc] initWithObjects:sortDescriptor, nil];
    [fetchRequest setSortDescriptors:sortDescriptors];
    
    NSError *error;
    NSArray *fetchResults = [_managedObjectContext executeFetchRequest:fetchRequest error:&error];
    if (fetchResults == nil) {
        NSLog(@"No results");
        _recordCountLabel.text = @"Nothing";
        _recordNameLabel.text = @"Nothing";
    } else {
        _contactArray = [NSMutableArray arrayWithArray:fetchResults];
        _recordCountLabel.text = [NSString stringWithFormat:@"%i",[_contactArray count]];
        if ([_contactArray count] > 0) {
            _recordNameLabel.text = [[_contactArray objectAtIndex:0] lastName];
        } else {
            _recordNameLabel.text = @"No Records Found";
        }
    }
}

- (IBAction)addRecordPressed:(id)sender {
    NSLog(@"Add...");
    Contacts *newContact = (Contacts *)[NSEntityDescription insertNewObjectForEntityForName:@"Contacts" inManagedObjectContext:_managedObjectContext];
    [newContact setFirstName:@"John"];
    [newContact setLastName:@"Adams"];
    [newContact setHeightInMM:[NSNumber numberWithInt:1500]];
    [newContact setDateEntered:[NSDate date]];
    [newContact setUserID:@"Admin"];
    Orders *newOrder = (Orders *)[NSEntityDescription insertNewObjectForEntityForName:@"Orders" inManagedObjectContext:_managedObjectContext];
    [newOrder setOrderDate:[NSDate date]];
    [newOrder setOrderTotal:[NSDecimalNumber decimalNumberWithString:@"123.12"]];
    [newOrder setOrderComplete:[NSNumber numberWithBool:YES]];
    [newOrder setDateEntered:[NSDate date]];
    [newOrder setUserID:@"Admin"];
    newOrder.relationshipOrderContact = newContact;
}

- (IBAction)deleteRecordPressed:(id)sender {
    NSLog(@"Delete...");
    Contacts *objectToDelete = [_contactArray objectAtIndex:0];
    [_managedObjectContext deleteObject:objectToDelete];
}

- (IBAction)changeRecordPressed:(id)sender {
    NSLog(@"Change...");
    Contacts *currentContact = [_contactArray objectAtIndex:0];
    [currentContact setLastName:@"Billingham"];
    [currentContact setDateUpdated:[NSDate date]];
    [currentContact setUserID:@"Admin"];
}

- (IBAction)rollbackPressed:(id)sender {
    NSLog(@"Rollback...");
    [_managedObjectContext rollback];
}

- (IBAction)savePressed:(id)sender {
    NSLog(@"Save...");
    [[self getAppDelegate] saveAllChanges];
}

#pragma mark - Flipside View

- (void)flipsideViewControllerDidFinish:(DETFlipsideViewController *)controller
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showAlternate"]) {
        [[segue destinationViewController] setDelegate:self];
    }
}

@end
