//
//  XBNoteManager.m
//  iOSCreateNote
//
//  Created by Anuj on 20/05/14.
//  Copyright (c) 2014 Xebia. All rights reserved.
//

#import "XBNoteManager.h"
#import "CoreDataContextFactory.h"
#import "Note.h"

#define NOTE_TEXT @"noteText"

@interface XBNoteManager()
@property (nonatomic, weak) NSManagedObjectContext *context;
@end

@implementation XBNoteManager

#pragma mark Singleton Methods

+ (id)sharedManager {
    static XBNoteManager *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    });
    
    return sharedMyManager;
}

- (id)init {
    if (self = [super init]) {
        self.context = [[CoreDataContextFactory sharedCoreDataContextFactory] managedObjectContext];
    }
    return self;
}

- (void)dealloc {
    // Should never be called, but just here for clarity really.
}


- (void)saveContext {
    [[CoreDataContextFactory sharedCoreDataContextFactory] saveContext];
}


-(NSFetchRequest *)createRequestForEntityName:(NSString *)entityName {
    
	NSEntityDescription *entity = [NSEntityDescription entityForName:entityName inManagedObjectContext:self.context];
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
	[request setEntity:entity];
	return request;
}

- (NSArray*) fetchNotes{
    
    NSFetchRequest *request = [self createRequestForEntityName:NSStringFromClass([Note class])];
    NSError *error = nil;
    NSArray *results = [self.context executeFetchRequest:request error:&error];
    return results;

}

- (void) addNote:(NSString*) noteText{
    NSEntityDescription *entity = [NSEntityDescription entityForName:NSStringFromClass([Note class]) inManagedObjectContext:self.context];
    
    Note *note = (Note *)[[NSManagedObject alloc] initWithEntity:entity insertIntoManagedObjectContext:self.context];
    
    note.noteText = noteText;
    
    [self saveContext];

}
@end
