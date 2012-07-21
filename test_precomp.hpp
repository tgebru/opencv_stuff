#ifdef __GNUC__
#  pragma GCC diagnostic ignored "-Wmissing-declarations"
#  pragma GCC diagnostic ignored "-Wmissing-prototypes" //OSX
#endif

#ifndef __OPENCV_TEST_PRECOMP_HPP__
#define __OPENCV_TEST_PRECOMP_HPP__

#include "ts.hpp" //b/c it's not included in framework
#include "opencv2/imgproc/imgproc.hpp"
#include "opencv2/imgproc/imgproc_c.h"
#include "opencv2/calib3d/calib3d.hpp"
#include "opencv2/highgui/highgui.hpp"
#include <iostream>

namespace cvtest
{
    void Rodrigues(const Mat& src, Mat& dst, Mat* jac=0);
}

#endif

