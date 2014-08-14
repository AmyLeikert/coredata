//
//  DETFlipsideViewController.m
//  Core Data Class
//
//  Created by Thomas Crawford on 4/30/13.
//  Copyright (c) 2013 Thomas Crawford. All rights reserved.
//

#import "DETFlipsideViewController.h"

@interface DETFlipsideViewController ()

@end

@implementation DETFlipsideViewController

- (void)awakeFromNib
{
    [super awakeFromNib];
}

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

#pragma mark - Actions

- (IBAction)done:(id)sender
{
    [self.delegate flipsideViewControllerDidFinish:self];
}

@end
