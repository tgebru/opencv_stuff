#ifdef __GNUC__
#  pragma GCC diagnostic ignored "-Wmissing-declarations"
#  pragma GCC diagnostic ignored "-Wmissing-prototypes" //OSX
#endif

#ifndef __OPENCV_PERF_PRECOMP_HPP__
#define __OPENCV_PERF_PRECOMP_HPP__

// SHIRMUNG:
// changing path because it's not included in the framework
#include "ts.hpp"

#ifdef GTEST_CREATE_SHARED_LIBRARY
#error no modules except ts should have GTEST_CREATE_SHARED_LIBRARY defined
#endif

#endif