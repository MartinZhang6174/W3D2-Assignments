//
//  TodoCell.m
//  To-do List
//
//  Created by Martin Zhang on 2016-07-12.
//  Copyright © 2016 Martin Zhang. All rights reserved.
//

#import "TodoCell.h"

@implementation TodoCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.gr = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipedCell:)];
    self.gr.direction = UISwipeGestureRecognizerDirectionRight;
    [self addGestureRecognizer:self.gr];
}

- (void)swipedCell:(UIGestureRecognizer *)sender {
    [self.delegate swipedCell:self];
    NSLog(@"Swiped cell.");
}

@end
