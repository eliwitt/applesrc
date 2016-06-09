//
//  ViewController.m
//  StoryTellerFun
//
//  Created by John Witt on 5/31/16.
//  Copyright © 2016 John Witt. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UITextField *thePlace;
@property (strong, nonatomic) IBOutlet UITextField *theVerb;
@property (strong, nonatomic) IBOutlet UITextField *theNumber;
@property (strong, nonatomic) IBOutlet UITextView *theTemplate;
@property (strong, nonatomic) IBOutlet UITextView *theStory;
@property (strong, nonatomic) IBOutlet UIButton *theGenerateStory;

- (IBAction)createStory:(id)sender;
- (IBAction)hideKeyBoard:(id)sender;
@end

@implementation ViewController

- (void)viewDidLoad {
    
    // Do any additional setup after loading the view, typically from a nib.
    UIImage *normalImage = [[UIImage imageNamed:@"images/whiteButton.png"]
                            stretchableImageWithLeftCapWidth:12.0 topCapHeight:0.0];
    UIImage *pressedImage = [[UIImage imageNamed:@"images/blueButton.png"]
                             stretchableImageWithLeftCapWidth:12.0 topCapHeight:0.0];
    [self.theGenerateStory setBackgroundImage:normalImage forState:UIControlStateNormal];
    [self.theGenerateStory setBackgroundImage:pressedImage forState:UIControlStateHighlighted];
    
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)createStory:(id)sender {
    self.theStory.text = [self.theTemplate.text
                          stringByReplacingOccurrencesOfString:@"<place>" withString:self.thePlace.text];
    self.theStory.text = [self.theStory.text
                          stringByReplacingOccurrencesOfString:@"<verb>" withString:self.theVerb.text];
    self.theStory.text = [self.theStory.text
                          stringByReplacingOccurrencesOfString:@"<number>" withString:self.theNumber.text];
}

- (IBAction)hideKeyBoard:(id)sender {
    [self.thePlace resignFirstResponder];
    [self.theVerb resignFirstResponder];
    [self.theStory resignFirstResponder];
    [self.theNumber resignFirstResponder];
    [self.theTemplate resignFirstResponder];
}
@end
