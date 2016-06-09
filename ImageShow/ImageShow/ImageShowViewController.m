//
//  ImageShowViewController.m
//  ImageShow
//
//  Created by John Witt on 9/5/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ImageShowViewController.h"

@implementation ImageShowViewController

@synthesize toggleButton;
@synthesize imageView;
@synthesize animationSpeed;
@synthesize hopsPerSecond;

-(IBAction)toggleAnimation:(id)sender{
    if (imageView.isAnimating) {
        [imageView stopAnimating];
        [toggleButton setTitle:@"Hop!" forState:UIControlStateNormal];
    } else {
        [imageView startAnimating];
        [toggleButton setTitle:@"Sit Still!" forState:UIControlStateNormal];
    }
}

-(IBAction)setSpeed:(id)sender{
    NSString *hopRateString;
    imageView.animationDuration=2 - animationSpeed.value;
    [imageView startAnimating];
    [toggleButton setTitle:@"Sit Still!" forState:UIControlStateNormal];
    hopRateString=[[NSString alloc]
                   initWithFormat:@"%1.2f hps", 1/(2 - animationSpeed.value)];
    hopsPerSecond.text = hopRateString;
    [hopRateString release];
}

-(void)dealloc {
    [toggleButton release];
    [imageView release];
    [animationSpeed release];
    [hopsPerSecond release];
    [super dealloc];
}


- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    NSArray *hopAnimation;
    hopAnimation = [[NSArray alloc] initWithObjects:[UIImage imageNamed:@"frame-1.png"],
                    [UIImage imageNamed:@"frame-2.png"],
                    [UIImage imageNamed:@"frame-3.png"],
                    [UIImage imageNamed:@"frame-4.png"],
                    [UIImage imageNamed:@"frame-5.png"],
                    [UIImage imageNamed:@"frame-6.png"],
                    [UIImage imageNamed:@"frame-7.png"],
                    [UIImage imageNamed:@"frame-8.png"],
                    [UIImage imageNamed:@"frame-9.png"],
                    [UIImage imageNamed:@"frame-10.png"],
                    [UIImage imageNamed:@"frame-11.png"],
                    [UIImage imageNamed:@"frame-12.png"],
                    [UIImage imageNamed:@"frame-13.png"],
                    [UIImage imageNamed:@"frame-14.png"],
                    [UIImage imageNamed:@"frame-15.png"],
                    [UIImage imageNamed:@"frame-16.png"],
                    [UIImage imageNamed:@"frame-17.png"],
                    [UIImage imageNamed:@"frame-18.png"],
                    [UIImage imageNamed:@"frame-19.png"],
                    [UIImage imageNamed:@"frame-20.png"]
                    , nil];
    imageView.animationImages=hopAnimation;
    imageView.animationDuration=1;
    [hopAnimation release];
    [super viewDidLoad];
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
