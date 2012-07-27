#pragma once

#if defined(__linux__) || defined(LINUX) || defined(__APPLE__) || defined(ANDROID)

#include <opencv2/core/core.hpp>
#include <opencv2/objdetect/objdetect.hpp>

#include <vector>

class DetectionBasedTracker
{
    public:
        struct Parameters
        {
<<<<<<< HEAD
            int minObjectSize;
            int maxObjectSize;
            double scaleFactor;
            int maxTrackLifetime;
            int minNeighbors;
=======
            int maxTrackLifetime;
>>>>>>> 803c418f17285f8d2e733f327d42da97a9c848c5
            int minDetectionPeriod; //the minimal time between run of the big object detector (on the whole frame) in ms (1000 mean 1 sec), default=0

            Parameters();
        };

<<<<<<< HEAD
        DetectionBasedTracker(const std::string& cascadeFilename, const Parameters& params);
=======
        class IDetector
        {
            public:
                IDetector():
                    minObjSize(96, 96),
                    maxObjSize(INT_MAX, INT_MAX),
                    scaleFactor(1.1f),
                    minNeighbours(2)
                {}

                virtual void detect(const cv::Mat& Image, std::vector<cv::Rect>& objects) = 0;

                void setMinObjectSize(const cv::Size& min)
                {
                    minObjSize = min;
                }
                void setMaxObjectSize(const cv::Size& max)
                {
                    maxObjSize = max;
                }
                cv::Size getMinObjectSize() const
                {
                    return minObjSize;
                }
                cv::Size getMaxObjectSize() const
                {
                    return maxObjSize;
                }
                float getScaleFactor()
                {
                    return scaleFactor;
                }
                void setScaleFactor(float value)
                {
                    scaleFactor = value;
                }
                int getMinNeighbours()
                {
                    return minNeighbours;
                }
                void setMinNeighbours(int value)
                {
                    minNeighbours = value;
                }
                virtual ~IDetector() {}

            protected:
                cv::Size minObjSize;
                cv::Size maxObjSize;
                int minNeighbours;
                float scaleFactor;
        };

        DetectionBasedTracker(cv::Ptr<IDetector> MainDetector, cv::Ptr<IDetector> TrackingDetector, const Parameters& params);
>>>>>>> 803c418f17285f8d2e733f327d42da97a9c848c5
        virtual ~DetectionBasedTracker();

        virtual bool run();
        virtual void stop();
        virtual void resetTracking();

        virtual void process(const cv::Mat& imageGray);

        bool setParameters(const Parameters& params);
        const Parameters& getParameters();

        
        typedef std::pair<cv::Rect, int> Object;
        virtual void getObjects(std::vector<cv::Rect>& result) const;
        virtual void getObjects(std::vector<Object>& result) const;

    protected:
        class SeparateDetectionWork;
        cv::Ptr<SeparateDetectionWork> separateDetectionWork;
        friend void* workcycleObjectDetectorFunction(void* p);

<<<<<<< HEAD

=======
>>>>>>> 803c418f17285f8d2e733f327d42da97a9c848c5
        struct InnerParameters
        {
            int numLastPositionsToTrack;
            int numStepsToWaitBeforeFirstShow;
            int numStepsToTrackWithoutDetectingIfObjectHasNotBeenShown;
            int numStepsToShowWithoutDetecting;

            float coeffTrackingWindowSize;
            float coeffObjectSizeToTrack;
            float coeffObjectSpeedUsingInPrediction;

            InnerParameters();
        };
        Parameters parameters;
        InnerParameters innerParameters;

        struct TrackedObject
        {
            typedef std::vector<cv::Rect> PositionsVector;

            PositionsVector lastPositions;

            int numDetectedFrames;
            int numFramesNotDetected;
            int id;

            TrackedObject(const cv::Rect& rect):numDetectedFrames(1), numFramesNotDetected(0)
            {
                lastPositions.push_back(rect);
                id=getNextId();
            };

            static int getNextId()
            {
                static int _id=0;
                return _id++;
            }
        };

        int numTrackedSteps;
        std::vector<TrackedObject> trackedObjects;

        std::vector<float> weightsPositionsSmoothing;
        std::vector<float> weightsSizesSmoothing;

<<<<<<< HEAD
        cv::CascadeClassifier cascadeForTracking;

=======
        cv::Ptr<IDetector> cascadeForTracking;
>>>>>>> 803c418f17285f8d2e733f327d42da97a9c848c5

        void updateTrackedObjects(const std::vector<cv::Rect>& detectedObjects);
        cv::Rect calcTrackedObjectPositionToShow(int i) const;
        void detectInRegion(const cv::Mat& img, const cv::Rect& r, std::vector<cv::Rect>& detectedObjectsInRegions);
};

#endif

