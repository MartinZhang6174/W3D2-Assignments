//
//  ModelViewController.m
//  To-do List
//
//  Created by Martin Zhang on 2016-07-12.
//  Copyright © 2016 Martin Zhang. All rights reserved.
//

#import "ModelViewController.h"

@implementation ModelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.view.backgroundColor = [UIColor lightGrayColor];
}

- (IBAction)submitButtonPressed:(id)sender {
    Todo *addedToDo = [[Todo alloc] init];

    NSString *titleOfNewTodo = self.titleInput.text;
    NSString *descriptionOfNewTodo = self.descriptionInput.text;
    NSInteger priorityNumberOfNewTodo = [self.priorityInput.text integerValue];
    
    if (self.titleInput.text != nil && self.descriptionInput.text!= nil && self.priorityInput.text != nil) {
        addedToDo.title = titleOfNewTodo;
        addedToDo.detail = descriptionOfNewTodo;
        addedToDo.priorityNumber = priorityNumberOfNewTodo;
        [self.delegate shouldSave:addedToDo];
        [self.navigationController popToRootViewControllerAnimated:YES];
    } else {
        self.warningLabel.text = @"Warning, you have incomplete textfield(s).";
    }
}



@end
