//
//  ViewController.m
//  XCProgressLineViewExample
//
//  Created by 樊小聪 on 2017/3/8.
//  Copyright © 2017年 樊小聪. All rights reserved.
//

#import "ViewController.h"

#import "XCProgressLineView.h"

@interface ViewController () <UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark - 📕 👀 UITableViewDataSource 👀

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 30;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    XCProgressLineView *progressLine = [cell.contentView viewWithTag:100];
    
    progressLine.progress = (arc4random_uniform(100) + 1) / 100.0;
    
    return cell;
}


@end
