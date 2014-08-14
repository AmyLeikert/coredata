//
//  Contacts.h
//  Core Data Class
//
//  Created by Thomas Crawford on 3/7/14.
//  Copyright (c) 2014 Thomas Crawford. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Contacts : NSManagedObject

@property (nonatomic, retain) NSString * cellphoneNumber;
@property (nonatomic, retain) NSDate * dateEntered;
@property (nonatomic, retain) NSDate * dateUpdated;
@property (nonatomic, retain) NSString * firstName;
@property (nonatomic, retain) NSNumber * heightInMM;
@property (nonatomic, retain) NSString * lastName;
@property (nonatomic, retain) NSString * latitude;
@property (nonatomic, retain) NSString * longitude;
@property (nonatomic, retain) NSString * postalCode;
@property (nonatomic, retain) NSString * userID;
@property (nonatomic, retain) NSSet *relationshipContactOrders;
@end

@interface Contacts (CoreDataGeneratedAccessors)

- (void)addRelationshipContactOrdersObject:(NSManagedObject *)value;
- (void)removeRelationshipContactOrdersObject:(NSManagedObject *)value;
- (void)addRelationshipContactOrders:(NSSet *)values;
- (void)removeRelationshipContactOrders:(NSSet *)values;

@end
