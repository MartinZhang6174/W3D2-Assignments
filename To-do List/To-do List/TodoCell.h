//
//  TodoCell.h
//  To-do List
//
//  Created by Martin Zhang on 2016-07-12.
//  Copyright © 2016 Martin Zhang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TodoCellDelegate.h"

@interface TodoCell : UITableViewCell

@property (nonatomic, weak) id<TodoCellDelegate> delegate;
@property (nonatomic) UISwipeGestureRecognizer *gr;

@end
