//
//  MainViewController.mm
//  OpenCVTests
//
//  Created by Shirmung Bielefeld on 7/30/12.
//  Copyright (c) 2012. All rights reserved.
//

#import "MainViewController.h"

#import "CVImageConverter.h"
#import "test_precomp.hpp"

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        // Custom initialization
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    BOOL fileExists = [[NSFileManager defaultManager] fileExistsAtPath:[self resultsFilePath]];
    
    if (fileExists) {
        // for now just print to console
        NSString *resultsString = [NSString stringWithContentsOfFile:[self resultsFilePath] encoding:NSUTF8StringEncoding error:nil];
        NSLog(@"%@", resultsString);
    } else {
        int argc = 0;
        char **argv = NULL;
        
        cvtest::TS::ptr()->init("cv");
        
        //::perf::Regression::Init("core");
        //::perf::TestBase::Init(argc, argv);
        ::testing::InitGoogleTest(&argc, argv);
        
        NSString *objCString = [NSString stringWithFormat:@"xml:%@", [self resultsFilePath]];
        std::string cString = [objCString cStringUsingEncoding:[NSString defaultCStringEncoding]];
        ::testing::GTEST_FLAG(output) = cString;
        
        RUN_ALL_TESTS();
        
        const ::testing::TestInfo* const test_info =
        ::testing::UnitTest::GetInstance()->current_test_info();
        printf("We are in test %s of test case %s.\n",
               test_info->name(), test_info->test_case_name());
    }
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (NSString *)resultsFilePath
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    
    return [documentsDirectory stringByAppendingPathComponent:@"results.xml"];
}

cv::Mat wrapCVImageConverter(const char* fileName, int flag)
{
    UIImage *image = [UIImage imageWithContentsOfFile:[NSString stringWithCString:fileName encoding:[NSString defaultCStringEncoding]]];
    
    if (flag == 0) {
        image = [CVImageConverter convertUIImageToGrayScale:image];
    }
    
    cv::Mat mat;
    [CVImageConverter CVMat:mat FromUIImage:image error:NULL];
    
    return mat;
}

@end
