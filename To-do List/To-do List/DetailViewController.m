//
//  DetailViewController.m
//  To-do List
//
//  Created by Martin Zhang on 2016-07-12.
//  Copyright © 2016 Martin Zhang. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(Todo *)newDetailItem {
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
            
        // Update the view.
        [self configureViewWithPriorityNumber:[_detailItem priorityNumber] andCompletion:newDetailItem.isCompleted];
    }
}

- (void)configureViewWithPriorityNumber:(NSInteger)priority andCompletion:(BOOL)completed {
    // Update the user interface for the detail item.
    if (_detailItem) {
        _detailDescriptionLabel.text = [NSString stringWithFormat:@"The priority of this task is #%ld.",(long)_detailItem.priorityNumber];
        if ([self.detailItem isCompleted]) {
            self.detailCompletionLabel.text = @"You have done this task!";
        } else {
            self.detailCompletionLabel.text = @"Keep working on this task!";
        }
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self configureViewWithPriorityNumber:0 andCompletion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
