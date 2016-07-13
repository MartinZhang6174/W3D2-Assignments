//
//  ModelViewControllerDelegate.h
//  To-do List
//
//  Created by Martin Zhang on 2016-07-12.
//  Copyright © 2016 Martin Zhang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Todo.h"

@protocol ModelViewControllerDelegate <NSObject>

- (void)shouldSave:(Todo *)todo;

@end
