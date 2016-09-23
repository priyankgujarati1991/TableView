//
//  ViewController.m
//  TableView
//
//  Created by Priyank on 04/09/16.
//  Copyright © 2016 Priyank. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"

@interface ViewController ()
{
    AppDelegate *appDelegate;
}
@end

@implementation ViewController
@synthesize tblSimple;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    appDelegate =(AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    self.arrData = [[NSMutableArray alloc] init];
    
    [self.arrData addObject:@"One"];
    [self.arrData addObject:@"Two"];
    [self.arrData addObject:@"Three"];
    [self.arrData addObject:@"Four"];
    [self.arrData addObject:@"Five"];

}

#pragma mark - UITableView DataSource Methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.arrData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    cell.textLabel.text = [self.arrData objectAtIndex:indexPath.row];
    return cell;
}

#pragma mark - UITableView Delegate Methods

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *message=[NSString stringWithFormat:@"User selected %@",[self.arrData objectAtIndex:indexPath.row]];
    UIAlertController *alertController = [UIAlertController
                                          alertControllerWithTitle:@"iOS"
                                          message:message
                                          preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *okAction = [UIAlertAction
                               actionWithTitle:@"OK"
                               style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction *action)
                               {
                                   NSLog(@"OK action");
                               }];
    
    [alertController addAction:okAction];
    
    [self presentViewController:alertController animated:YES completion:nil];
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
