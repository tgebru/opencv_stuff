//
//  OpenCVTestViewController.m
//  OpenCVTest
//
//  Created by timnit gebru on 7/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "OpenCVTestViewController.h"
#include "test_precomp.hpp"


@implementation OpenCVTestViewController

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    CV_TEST_MAIN("cv")
	// Do any additional setup after loading the view, typically from a nib.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{

        return YES;
}

@end
