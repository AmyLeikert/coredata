//
//  DETAppDelegate.h
//  Core Data Class
//
//  Created by Thomas Crawford on 4/30/13.
//  Copyright (c) 2013 Thomas Crawford. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DETAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveAllChanges;
- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
