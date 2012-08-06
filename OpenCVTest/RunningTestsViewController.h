//
//  RunningTestsViewController.h
//  OpenCVTests
//
//  Created by Shirmung Bielefeld on 7/21/12.
//  Copyright (c) 2012. All rights reserved.
//

#import <UIKit/UIKit.h>

#ifdef __cplusplus
#import "CWrapper.h"
#endif

id _self;

@interface RunningTestsViewController : UIViewController
{
    BOOL calib3dTest;
    UITextView *outputTextView;
}

@property (nonatomic, assign) BOOL calib3dTest;
@property (nonatomic, retain) IBOutlet UITextView *outputTextView;

@end
