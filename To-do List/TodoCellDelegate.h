
//
//  TodoCellDelegate.h
//  To-do List
//
//  Created by Martin Zhang on 2016-07-12.
//  Copyright © 2016 Martin Zhang. All rights reserved.
//

#import <Foundation/Foundation.h>
@class TodoCell;

@protocol TodoCellDelegate <NSObject>

- (void)swipedCell:(TodoCell *)cell;

@end
