//
//  OpenCVTestViewController.mm
//  OpenCVTest
//
//  Created by Shirmung Bielefeld on 7/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "OpenCVTestViewController.h"
#include "test_precomp.hpp"

@implementation OpenCVTestViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    cvtest::TS::ptr()->init("cv");
    int argc = 0;
    char **argv = NULL;
    ::testing::InitGoogleTest(&argc, argv);
    RUN_ALL_TESTS();
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end