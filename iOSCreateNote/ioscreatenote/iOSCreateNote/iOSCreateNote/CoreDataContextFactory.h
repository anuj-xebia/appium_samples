//
//  CoreDataContextFactory.h
//
//  Created by Anuj Yadav on 2/4/13.
//  Copyright (c) 2013. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CoreDataContextFactory : NSObject

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (readonly, strong, nonatomic) NSString *sqliteFileName;

+ (CoreDataContextFactory*)sharedCoreDataContextFactory;

- (void)resetDataStore;
- (void)saveContext;

@end
