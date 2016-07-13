//
//  MasterViewController.m
//  To-do List
//
//  Created by Martin Zhang on 2016-07-12.
//  Copyright © 2016 Martin Zhang. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "Todo.h"
#import "ModelViewController.h"
#import "ModelViewControllerDelegate.h"
#import "TodoCellDelegate.h"
#import "TodoCell.h"

@interface MasterViewController () <UITabBarDelegate, UITableViewDataSource, ModelViewControllerDelegate, TodoCellDelegate>

@property NSMutableArray *toDoListArray;
//@property NSArray *toDoListArray;

@end

@implementation MasterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;


    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    self.navigationItem.rightBarButtonItem = addButton;
    
    Todo *todo1 = [[Todo alloc] init];
    Todo *todo2 = [[Todo alloc] init];
    Todo *todo3 = [[Todo alloc] init];
    todo1.title = @"Refueling AMG GT S";
    todo2.title = @"Detailing and washing AMG GT S";
    todo3.title = @"Driving AMG GT S around";
    todo1.detail = @"The AMG GT S should only be fueled by #91 class gasoline.";
    todo2.detail = @"The look of the AMG GT S is breathtaking but it has to be clean.";
    todo3.detail = @"When driving an AMG GT S, you have the world's attention.";
    todo1.priorityNumber = 1;
    todo2.priorityNumber = 2;
    todo3.priorityNumber = 3;
    todo1.isCompleted = NO;
    todo2.isCompleted = NO;
    todo3.isCompleted = NO;
        
    self.toDoListArray = [NSMutableArray arrayWithObjects:
                        todo1,
                        todo2,
                        todo3,
                          nil
                            ];
}

- (void)viewWillAppear:(BOOL)animated {
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)swipedCell:(TodoCell *)todoCell {
    NSIndexPath *ip = [self.tableView indexPathForCell:todoCell];
    
    Todo *swipedTodo = self.toDoListArray[ip.row];
    swipedTodo.isCompleted = YES;
    [self.tableView reloadData];
}

- (void)insertNewObject:(id)sender {
    ModelViewController *addingViewController = [[ModelViewController alloc] init];
    addingViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"addingView"];
    addingViewController.delegate = self;
    [self.navigationController pushViewController:addingViewController animated:YES];
}

-(void)shouldSave:(Todo *)todo {
    [self.toDoListArray insertObject:todo atIndex:0];
    NSIndexPath *newTodoIndexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[newTodoIndexPath] withRowAnimation:UITableViewRowAnimationLeft];
}



#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        Todo *toDoObject = self.toDoListArray[indexPath.row];
        DetailViewController *controller = (DetailViewController *)[segue destinationViewController];
        [controller setDetailItem:toDoObject];
    }
}

//-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    
//}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.toDoListArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *identifier = @"ATodoCell";
    TodoCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];

    Todo *todoItem = self.toDoListArray[indexPath.row];
    cell.textLabel.text = todoItem.title;
    cell.detailTextLabel.text = todoItem.detail;
    cell.delegate = self;
    
    if (todoItem.isCompleted) {
        NSMutableAttributedString *cutStringTitle = [[NSMutableAttributedString alloc] initWithString:todoItem.title];
        [cutStringTitle addAttribute:NSStrikethroughStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:NSMakeRange(0, [cutStringTitle length])];
        
        NSMutableAttributedString *cutStringDescription = [[NSMutableAttributedString alloc] initWithString:todoItem.title];
        
        [cutStringDescription addAttribute:NSStrikethroughStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:NSMakeRange(0, [cutStringDescription length])];
        
        [cell.textLabel setAttributedText:cutStringTitle];
        [cell.detailTextLabel setAttributedText:cutStringDescription];
    }
    
    
    return cell;
}



- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.toDoListArray removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}
    



@end
