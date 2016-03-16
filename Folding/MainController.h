//
//  MainController.h
//  Folding
//
//  Created by Алексей Карасев on 16/03/16.
//  Copyright © 2016 Алексей Карасев. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainController : UITableViewController

@property (nonatomic) CGFloat kCloseCellHeight;
@property (nonatomic) CGFloat kOpenCellHeight;
@property (nonatomic) int kRowCount;
@property (nonatomic, strong) NSMutableArray<NSNumber *> *cellHeights;

@end
