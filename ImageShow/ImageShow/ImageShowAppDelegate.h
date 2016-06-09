//
//  ImageShowAppDelegate.h
//  ImageShow
//
//  Created by John Witt on 9/5/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ImageShowViewController;

@interface ImageShowAppDelegate : NSObject <UIApplicationDelegate>

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet ImageShowViewController *viewController;

@end
