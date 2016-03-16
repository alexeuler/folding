//
//  MainController.m
//  Folding
//
//  Created by Алексей Карасев on 16/03/16.
//  Copyright © 2016 Алексей Карасев. All rights reserved.
//

#import "MainController.h"
@import FoldingCell;

@interface MainController ()

@end

@implementation MainController


- (CGFloat) kCloseCellHeight {
    return 75;
}

- (CGFloat) kOpenCellHeight {
    return 200;
}

- (int)kRowCount {
    return 2;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.cellHeights = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < self.kRowCount; i++) {
        [[self cellHeights] addObject:[NSNumber numberWithFloat:[self kCloseCellHeight]]];
    }
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.kRowCount;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat height = [[self cellHeights][indexPath.row] floatValue];
    return height;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    FoldingCell* cell = (FoldingCell*)[tableView cellForRowAtIndexPath:indexPath];
    float duration = 0.0;
    if ([self.cellHeights[indexPath.row] floatValue] == self.kCloseCellHeight) {
        self.cellHeights[indexPath.row] = [NSNumber numberWithFloat:self.kOpenCellHeight];
        [cell selectedAnimation:true animated:true completion:nil];
        duration = 0.5;
    } else {
        self.cellHeights[indexPath.row] = [NSNumber numberWithFloat:self.kCloseCellHeight];
        [cell selectedAnimation:false animated:true completion:nil];
        duration = 1.1;
    }
    
    [UIView animateWithDuration:duration delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        [tableView beginUpdates];
        [tableView endUpdates];
    } completion:nil];
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([cell isKindOfClass:[FoldingCell class]]) {
        FoldingCell *foldingCell = (FoldingCell*) cell;
        if ([self.cellHeights[indexPath.row] floatValue] == self.kCloseCellHeight) {
            [foldingCell selectedAnimation:false animated:false completion:nil];
        } else
            [foldingCell selectedAnimation:true animated:false completion:nil];
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"folding" forIndexPath:indexPath];
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
