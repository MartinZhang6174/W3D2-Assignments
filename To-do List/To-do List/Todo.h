//
//  Todo.h
//  To-do List
//
//  Created by Martin Zhang on 2016-07-12.
//  Copyright © 2016 Martin Zhang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Todo : NSObject

@property NSString *title;
@property NSString *detail;
@property NSInteger priorityNumber;
@property BOOL isCompleted;

@end
