//
//  DetailViewController.m
//  CodeChallenge2
//
//  Created by Andrew Liu on 10/30/14.
//  Copyright (c) 2014 Andrew Liu. All rights reserved.
//

#import "DetailViewController.h"
#import "WebViewController.h"
#import "City.h"

@interface DetailViewController () <UITextFieldDelegate,CityDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *detailImageView;
@property (weak, nonatomic) IBOutlet UITextField *cityName;
@property (weak, nonatomic) IBOutlet UITextField *cityState;
@property (weak, nonatomic) IBOutlet UILabel *wikiLabel;
@property NSString *cityURL;
@property (nonatomic) CGPoint touchPoint;
@property City *city;
@end

@implementation DetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.detailImageView.image = self.cityDetail.image;
    self.cityName.text = self.cityDetail.name;
    self.cityState.text = self.cityDetail.state;
    self.cityURL = self.cityDetail.url;
    self.city = [[City alloc]init];
    self.city.delegate = self;
}

-(void)theCityURL:(NSString *)url
{
    [self performSegueWithIdentifier:@"citySegue" sender:self];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.cityName resignFirstResponder];
    [self.cityState resignFirstResponder];
    return YES;
}

- (IBAction)editConfirmOnButtonPressed:(UIButton *)confirmButtom
{
    self.cityDetail.name = self.cityName.text;
    self.cityDetail.state = self.cityState.text;
}

- (IBAction)wikiOnLabelTapped:(UITapGestureRecognizer *)gesture
{
    self.touchPoint = [gesture locationInView:self.view];
    if (CGRectContainsPoint(self.wikiLabel.frame, self.touchPoint))
    {
        [self performSegueWithIdentifier:@"webSegue" sender:self];
    }
}

- (IBAction)cityWikiOnButtonPressed:(UIButton *)sender
{
    [self.city wikiURL];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    WebViewController *web = segue.destinationViewController;
    web.url = self.cityURL;
}

@end
