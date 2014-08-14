//
//  DETFlipsideViewController.h
//  Core Data Class
//
//  Created by Thomas Crawford on 4/30/13.
//  Copyright (c) 2013 Thomas Crawford. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DETFlipsideViewController;

@protocol DETFlipsideViewControllerDelegate
- (void)flipsideViewControllerDidFinish:(DETFlipsideViewController *)controller;
@end

@interface DETFlipsideViewController : UIViewController

@property (weak, nonatomic) id <DETFlipsideViewControllerDelegate> delegate;

- (IBAction)done:(id)sender;

@end
