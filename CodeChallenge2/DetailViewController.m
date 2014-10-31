//
//  DetailViewController.m
//  CodeChallenge2
//
//  Created by Andrew Liu on 10/30/14.
//  Copyright (c) 2014 Andrew Liu. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *detailImageView;
@property (weak, nonatomic) IBOutlet UITextField *cityName;
@property (weak, nonatomic) IBOutlet UITextField *cityState;
@property (weak, nonatomic) IBOutlet UILabel *wikiLabel;
@property (nonatomic) CGPoint touchPoint;
@end

@implementation DetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.detailImageView.image = self.cityDetail.image;
    self.cityName.text = self.cityDetail.name;
    self.cityState.text = self.cityDetail.state;
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
        NSLog(@"AAA");
    }
}


@end
