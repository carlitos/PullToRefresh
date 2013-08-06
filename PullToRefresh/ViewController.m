//
//  ViewController.m
//  PullToRefresh
//
//  Created by Carlitos on 06/08/13.
//  Copyright (c) 2013 CarlitosApps. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    // Create a couple of instance variables
    NSMutableArray      *mutableArrayOfItems;
    UIRefreshControl    *refreshControl;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Filling the mutable array
    mutableArrayOfItems = [[NSMutableArray alloc] init];
    [mutableArrayOfItems addObject:@"1"];
    [mutableArrayOfItems addObject:@"2"];
    
    //
    self.dataTableView.delegate = self;
    self.dataTableView.dataSource = self;
    
    
    //Instance Refresh Control Type
    refreshControl = [[UIRefreshControl alloc]init];
    
    [refreshControl addTarget:self action:@selector(refreshTableView) forControlEvents:UIControlEventValueChanged];
    
    [self.dataTableView addSubview:refreshControl];
    
}

-(void)refreshTableView
{
    [self.dataTableView reloadData];
    [refreshControl endRefreshing];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// Then when the buttons its pressed 
- (IBAction)addItemButton:(id)sender {
    
    [mutableArrayOfItems addObject:[NSString stringWithFormat:@"%d", [mutableArrayOfItems count]+1]];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [mutableArrayOfItems count];
}

-(UITableViewCell*)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIdentifier    = @"Cell";
    UITableViewCell *cell       = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    NSString *str = [mutableArrayOfItems objectAtIndex:indexPath.row];
    
    cell.textLabel.text = str;
    
    return cell;
}


@end
