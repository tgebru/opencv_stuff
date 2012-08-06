//
//  RunningTestsViewController.mm
//  OpenCVTests
//
//  Created by Shirmung Bielefeld on 7/21/12.
//  Copyright (c) 2012. All rights reserved.
//

#import "RunningTestsViewController.h"
#import "CVImageConverter.h"
#import "test_precomp.hpp"

@implementation RunningTestsViewController

@synthesize calib3dTest;
@synthesize outputTextView;

- (id)initWithCoder:(NSCoder *)decoder
{
    self = [super initWithCoder:decoder];

    if (self) {
        // Custom initialization
        _self = self;
    }

    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

    BOOL fileExists = [[NSFileManager defaultManager] fileExistsAtPath:[self resultsFilePath]];

    if (fileExists) {
        // for now just print to console
        NSString *resultsString = [NSString stringWithContentsOfFile:[self resultsFilePath] encoding:NSUTF8StringEncoding error:nil];
        NSLog(@"%@", resultsString);
    } else {
        [self startGCD];
    }
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return TRUE;
}

#pragma mark - Helper methods

- (NSString *)resultsFilePath
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];

    return [documentsDirectory stringByAppendingPathComponent:@"results.xml"];
}

#pragma mark - UIImage to cv::Mat via C wrapper

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

#pragma mark - GCD via C wrapper

- (void)startGCD
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 1 * NSEC_PER_SEC),
                   dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, NULL), ^(void) {
       if (self.calib3dTest == YES) {
           int argc = 0;
           char **argv = NULL;

           cvtest::TS::ptr()->init("cv");

           ::testing::InitGoogleTest(&argc, argv);

           NSString *objCString = [NSString stringWithFormat:@"xml:%@", [self resultsFilePath]];
           std::string cString = [objCString cStringUsingEncoding:[NSString defaultCStringEncoding]];
           ::testing::GTEST_FLAG(output) = cString;

           RUN_ALL_TESTS();
       } else {
           [_self performSelectorOnMainThread:@selector(appendOutput:) withObject:@"No tests were selected to run." waitUntilDone:NO];
       }
    });
}

void grabOutput(const char* output)
{
    NSString *outputString = [NSString stringWithCString:output encoding:[NSString defaultCStringEncoding]];

    [_self performSelectorOnMainThread:@selector(appendOutput:) withObject:outputString waitUntilDone:NO];
}

- (void)appendOutput:(NSString *)output
{
    outputTextView.text = [NSString stringWithFormat:@"%@%@", outputTextView.text, output];
}

@end