//
//  Orders.h
//  Core Data Class
//
//  Created by Thomas Crawford on 3/7/14.
//  Copyright (c) 2014 Thomas Crawford. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Contacts;

@interface Orders : NSManagedObject

@property (nonatomic, retain) NSDate * dateEntered;
@property (nonatomic, retain) NSDate * dateUpdated;
@property (nonatomic, retain) NSNumber * orderComplete;
@property (nonatomic, retain) NSDate * orderDate;
@property (nonatomic, retain) NSDecimalNumber * orderTotal;
@property (nonatomic, retain) NSDate * shippingDate;
@property (nonatomic, retain) NSString * userID;
@property (nonatomic, retain) Contacts *relationshipOrderContact;

@end
