//
//  ImageShowViewController.h
//  ImageShow
//
//  Created by John Witt on 9/5/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageShowViewController : UIViewController {
    IBOutlet UIImageView *imageView;
    IBOutlet UIButton *toggleButton;
    IBOutlet UISlider *animationSpeed;
    IBOutlet UILabel *hopsPerSecond;
}

@property (retain, nonatomic) UIImageView *imageView;
@property (retain, nonatomic) UIButton *toggleButton;
@property (retain, nonatomic) UISlider *animationSpeed;
@property (retain, nonatomic) UILabel *hopsPerSecond;

-(IBAction)toggleAnimation:(id)sender;
-(IBAction)setSpeed:(id)sender;

@end
