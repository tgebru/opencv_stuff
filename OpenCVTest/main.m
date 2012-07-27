//
//  main.m
//  OpenCVTest
//
//  Created by timnit gebru on 7/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
//#include "test_precomp.hpp"

#import "OpenCVTestAppDelegate.h"
//#include "perf_precomp.hpp"


int main(int argc, char *argv[])
{
  /* 
    cvtest::TS::ptr()->init("cv");
    ::testing::InitGoogleTest(&argc, argv);
    RUN_ALL_TESTS();
    
    //CV_PERF_TEST_MAIN(core)
  */ 
    @autoreleasepool {
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([OpenCVTestAppDelegate class]));
    }
}
