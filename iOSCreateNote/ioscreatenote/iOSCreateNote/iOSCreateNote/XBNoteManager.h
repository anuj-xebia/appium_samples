//
//  XBNoteManager.h
//  iOSCreateNote
//
//  Created by Anuj on 20/05/14.
//  Copyright (c) 2014 Xebia. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XBNoteManager : NSObject

- (NSArray*) fetchNotes;
- (void) addNote:(NSString*) noteText;
+ (id)sharedManager;
@end
