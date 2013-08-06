//
//  ViewController.h
//  PullToRefresh
//
//  Created by Carlitos on 06/08/13.
//  Copyright (c) 2013 CarlitosApps. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

//Instance methods of the UIKit componets
// UITableView
// UIButton

@property (weak, nonatomic) IBOutlet UITableView *dataTableView;

- (IBAction)addItemButton:(id)sender;

@end
