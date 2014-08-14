//
//  DETMainViewController.h
//  Core Data Class
//
//  Created by Thomas Crawford on 4/30/13.
//  Copyright (c) 2013 Thomas Crawford. All rights reserved.
//

#import "DETFlipsideViewController.h"

#import <CoreData/CoreData.h>

@interface DETMainViewController : UIViewController <DETFlipsideViewControllerDelegate>

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@end
