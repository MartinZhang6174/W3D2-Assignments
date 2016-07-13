//
//  DetailViewController.h
//  To-do List
//
//  Created by Martin Zhang on 2016-07-12.
//  Copyright © 2016 Martin Zhang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Todo.h"

@interface DetailViewController : UIViewController

@property (strong, nonatomic) Todo *detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@property (strong, nonatomic) IBOutlet UILabel *detailCompletionLabel;


@end

