//
//  ModelViewController.h
//  To-do List
//
//  Created by Martin Zhang on 2016-07-12.
//  Copyright © 2016 Martin Zhang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Todo.h"
#import "ModelViewControllerDelegate.h"

@interface ModelViewController : UIViewController 

@property (strong, nonatomic) IBOutlet UITextField *titleInput;
@property (strong, nonatomic) IBOutlet UITextField *descriptionInput;
@property (strong, nonatomic) IBOutlet UITextField *priorityInput;
@property Todo *addedToDo;
@property (strong, nonatomic) IBOutlet UILabel *warningLabel;
@property (weak, nonatomic) id<ModelViewControllerDelegate> delegate;

@end
