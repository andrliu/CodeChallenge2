//
//  ViewController.m
//  CodeChallenge2
//
//  Created by Andrew Liu on 10/30/14.
//  Copyright (c) 2014 Andrew Liu. All rights reserved.
//

#import "RootViewController.h"
#import "City.h"
#import "DetailViewController.h"

@interface RootViewController () <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *cityTableView;
@property NSMutableArray *cities;
@end

@implementation RootViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    City *losAngeles = [[City alloc]initWithName:@"Los Angeles"
                                       withState:@"California"
                                       withImage:[UIImage imageNamed:@"losAngeles"]];
    City *sanFrancisco = [[City alloc]initWithName:@"San Francisco"
                                         withState:@"California"
                                         withImage:[UIImage imageNamed:@"sanFrancisco"]];
    City *seattle = [[City alloc]initWithName:@"Seattle"
                                    withState:@"Washington"
                                    withImage:[UIImage imageNamed:@"seattle"]];
    City *chicago = [[City alloc]initWithName:@"Chicago"
                                    withState:@"Illinois"
                                    withImage:[UIImage imageNamed:@"chicago"]];

    self.cities = [@[losAngeles, sanFrancisco, seattle, chicago] mutableCopy];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.cities.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cityCell" forIndexPath:indexPath];
    City *city = self.cities[indexPath.row];
    cell.textLabel.text = city.name;
    cell.detailTextLabel.text = city.state;
    cell.imageView.image = city.image;
    return cell;
}

- (IBAction)editOnButtonPressed:(UIBarButtonItem *)editButton
{
    self.cityTableView.editing = !self.cityTableView.editing;

    if ([editButton.title isEqualToString:@"Edit"])
    {
        editButton.title = @"Done";
    }
    else{
        editButton.title = @"Edit";
    }
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.cities removeObject:self.cities[indexPath.row]];
    [self.cityTableView reloadData];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    DetailViewController *detail = segue.destinationViewController;
    NSInteger rowNumber = [self.cityTableView indexPathForSelectedRow].row;
    City *cityDetail = [self.cities objectAtIndex:rowNumber];
    detail.cityDetail = cityDetail;
}

- (IBAction)unwindAndBook:(UIStoryboardSegue *)segue
{
    [self.cityTableView reloadData];
}

@end
