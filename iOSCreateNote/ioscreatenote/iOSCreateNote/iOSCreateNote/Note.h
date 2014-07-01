//
//  Note.h
//  iOSCreateNote
//
//  Created by Anuj on 20/05/14.
//  Copyright (c) 2014 Xebia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Note : NSManagedObject

@property (nonatomic, retain) NSString * noteText;

@end
