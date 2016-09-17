//
//  GPUImageFilterFactory.m
//  FilterCarousel
//
//  Created by Mike Bender on 2016-09-16.
//  Copyright © 2016 Mike Bender. All rights reserved.
//

#import "GPUImageFilterFactory.h"

@implementation GPUImageFilterFactory

+ (GPUImageFilterWrapper *)filterForType:(GPUImageCarouselFilterType)filterType {
    GPUImageFilterWrapper *wrapper = [[GPUImageFilterWrapper alloc] init];
    wrapper.filterType = filterType;
    
    switch (filterType) {
        case GPUIMAGE_NOFILTER: {
            wrapper.title = @"";
            wrapper.filter = [[GPUImageFilter alloc] init];
        }; break;
        case GPUIMAGE_SEPIA: {
            wrapper.title = @"Sepia";
            wrapper.defaultValue = 1.0;
            wrapper.minValue = 0.0;
            wrapper.maxValue = 1.0;
            
            wrapper.filter = [[GPUImageSepiaFilter alloc] init];
        }; break;
        case GPUIMAGE_PIXELLATE: {
            wrapper.title = @"Pixellate";
            
            wrapper.defaultValue = 0.05;
            wrapper.minValue = 0.0;
            wrapper.maxValue = 0.3;
            
            wrapper.filter = [[GPUImagePixellateFilter alloc] init];
        }; break;
        case GPUIMAGE_POLARPIXELLATE:
        {
            wrapper.title = @"Polar Pixellate";
            
            wrapper.defaultValue = 0.05;
            wrapper.minValue = -0.1;
            wrapper.maxValue = 0.1;
            
            wrapper.filter = [[GPUImagePolarPixellateFilter alloc] init];
        }; break;
        case GPUIMAGE_PIXELLATE_POSITION:
        {
            wrapper.title = @"Pixellate (position)";
            
            wrapper.defaultValue = 0.25;
            wrapper.minValue = 0.0;
            wrapper.maxValue = 0.5;
            
            wrapper.filter = [[GPUImagePixellatePositionFilter alloc] init];
        }; break;
        case GPUIMAGE_POLKADOT:
        {
            wrapper.title = @"Polka Dot";
            
            wrapper.defaultValue = 0.05;
            wrapper.minValue = 0.0;
            wrapper.maxValue = 0.3;
            
            wrapper.filter = [[GPUImagePolkaDotFilter alloc] init];
        }; break;
        case GPUIMAGE_HALFTONE:
        {
            wrapper.title = @"Halftone";
            
            wrapper.defaultValue = 0.01;
            wrapper.minValue = 0.0;
            wrapper.maxValue = 0.05;
            
            wrapper.filter = [[GPUImageHalftoneFilter alloc] init];
        }; break;
        case GPUIMAGE_CROSSHATCH:
        {
            wrapper.title = @"Crosshatch";
            
            wrapper.defaultValue = 0.03;
            wrapper.minValue = 0.01;
            wrapper.maxValue = 0.06;
            
            wrapper.filter = [[GPUImageCrosshatchFilter alloc] init];
        }; break;
        case GPUIMAGE_COLORINVERT:
        {
            wrapper.title = @"Color Invert";
            
            wrapper.filter = [[GPUImageColorInvertFilter alloc] init];
        }; break;
        case GPUIMAGE_GRAYSCALE:
        {
            wrapper.title = @"Grayscale";
            
            wrapper.filter = [[GPUImageGrayscaleFilter alloc] init];
        }; break;
        case GPUIMAGE_MONOCHROME:
        {
            wrapper.title = @"Monochrome";
            
            wrapper.defaultValue = 1.0;
            wrapper.minValue = 0.0;
            wrapper.maxValue = 1.0;
            
            wrapper.filter = [[GPUImageMonochromeFilter alloc] init];
            [(GPUImageMonochromeFilter *)wrapper.filter setColor:(GPUVector4){0.0f, 0.0f, 1.0f, 1.f}];
        }; break;
        case GPUIMAGE_FALSECOLOR:
        {
            wrapper.title = @"False Color";
            
            wrapper.filter = [[GPUImageFalseColorFilter alloc] init];
        }; break;
        case GPUIMAGE_SOFTELEGANCE:
        {
            wrapper.title = @"Soft Elegance (Lookup)";
            
            wrapper.filter = [[GPUImageSoftEleganceFilter alloc] init];
        }; break;
        case GPUIMAGE_MISSETIKATE:
        {
            wrapper.title = @"Miss Etikate (Lookup)";
            
            wrapper.filter = [[GPUImageMissEtikateFilter alloc] init];
        }; break;
        case GPUIMAGE_AMATORKA:
        {
            wrapper.title = @"Amatorka (Lookup)";
            
            wrapper.filter = [[GPUImageAmatorkaFilter alloc] init];
        }; break;
            
        case GPUIMAGE_SATURATION:
        {
            wrapper.title = @"Saturation";
            
            wrapper.defaultValue = 1.5;
            wrapper.minValue = 0.0;
            wrapper.maxValue = 2.0;
            
            wrapper.filter = [[GPUImageSaturationFilter alloc] init];
        }; break;
        case GPUIMAGE_CONTRAST:
        {
            wrapper.title = @"Contrast";
            
            wrapper.minValue = 0.0;
            wrapper.maxValue = 4.0;
            wrapper.defaultValue = 2.0;
            
            wrapper.filter = [[GPUImageContrastFilter alloc] init];
        }; break;
        case GPUIMAGE_BRIGHTNESS:
        {
            wrapper.title = @"Brightness";
            
            wrapper.minValue = -1.0;
            wrapper.maxValue = 1.0;
            wrapper.defaultValue = 0.5;
            
            wrapper.filter = [[GPUImageBrightnessFilter alloc] init];
        }; break;
        case GPUIMAGE_LEVELS:
        {
            wrapper.title = @"Levels";
            
            wrapper.minValue = 0.0;
            wrapper.maxValue = 1.0;
            wrapper.defaultValue = 0.0;
            
            wrapper.filter = [[GPUImageLevelsFilter alloc] init];
        }; break;
        case GPUIMAGE_RGB:
        {
            wrapper.title = @"RGB";
            
            wrapper.minValue = 0.0;
            wrapper.maxValue = 2.0;
            wrapper.defaultValue = 1.0;
            
            wrapper.filter = [[GPUImageRGBFilter alloc] init];
        }; break;
        case GPUIMAGE_HUE:
        {
            wrapper.title = @"Hue";
            
            wrapper.minValue = 0.0;
            wrapper.maxValue = 360.0;
            wrapper.defaultValue = 90.0;
            
            wrapper.filter = [[GPUImageHueFilter alloc] init];
        }; break;
        case GPUIMAGE_WHITEBALANCE:
        {
            wrapper.title = @"White Balance";
            
            wrapper.minValue = 2500.0;
            wrapper.maxValue = 7500.0;
            wrapper.defaultValue = 5000.0;
            
            wrapper.filter = [[GPUImageWhiteBalanceFilter alloc] init];
        }; break;
        case GPUIMAGE_EXPOSURE:
        {
            wrapper.title = @"Exposure";
            
            wrapper.minValue = -4.0;
            wrapper.maxValue = 4.0;
            wrapper.defaultValue = 0.0;
            
            wrapper.filter = [[GPUImageExposureFilter alloc] init];
        }; break;
        case GPUIMAGE_SHARPEN:
        {
            wrapper.title = @"Sharpen";
            
            wrapper.minValue = -1.0;
            wrapper.maxValue = 4.0;
            wrapper.defaultValue = 0.0;
            
            wrapper.filter = [[GPUImageSharpenFilter alloc] init];
        }; break;
        case GPUIMAGE_UNSHARPMASK:
        {
            wrapper.title = @"Unsharp Mask";
            
            wrapper.minValue = 0.0;
            wrapper.maxValue = 5.0;
            wrapper.defaultValue = 1.0;
            
            wrapper.filter = [[GPUImageUnsharpMaskFilter alloc] init];
            
            //            [(GPUImageUnsharpMaskFilter *)filter setIntensity:3.0];
        }; break;
        case GPUIMAGE_GAMMA:
        {
            wrapper.title = @"Gamma";
            
            wrapper.minValue = 0.0;
            wrapper.maxValue = 3.0;
            wrapper.defaultValue = 1.0;
            
            wrapper.filter = [[GPUImageGammaFilter alloc] init];
        }; break;
        case GPUIMAGE_TONECURVE:
        {
            wrapper.title = @"Tone curve";
            
            wrapper.minValue = 0.0;
            wrapper.maxValue = 1.0;
            wrapper.defaultValue = 0.5;
            
            wrapper.filter = [[GPUImageToneCurveFilter alloc] init];
            [(GPUImageToneCurveFilter *)wrapper.filter setBlueControlPoints:[NSArray arrayWithObjects:[NSValue valueWithCGPoint:CGPointMake(0.0, 0.0)], [NSValue valueWithCGPoint:CGPointMake(0.5, 0.5)], [NSValue valueWithCGPoint:CGPointMake(1.0, 0.75)], nil]];
        }; break;
        case GPUIMAGE_HIGHLIGHTSHADOW:
        {
            wrapper.title = @"Highlights and Shadows";
            
            wrapper.defaultValue = 1.0;
            wrapper.minValue = 0.0;
            wrapper.maxValue = 1.0;
            
            wrapper.filter = [[GPUImageHighlightShadowFilter alloc] init];
        }; break;
        case GPUIMAGE_HAZE:
        {
            wrapper.title = @"Haze / UV";
            
            wrapper.minValue = -0.2;
            wrapper.maxValue = 0.2;
            wrapper.defaultValue = 0.2;
            
            wrapper.filter = [[GPUImageHazeFilter alloc] init];
        }; break;
        case GPUIMAGE_AVERAGECOLOR:
        {
            wrapper.title = @"Average Color";
            
            wrapper.filter = [[GPUImageAverageColor alloc] init];
        }; break;
        case GPUIMAGE_LUMINOSITY:
        {
            wrapper.title = @"Luminosity";
            
            wrapper.filter = [[GPUImageLuminosity alloc] init];
        }; break;
        case GPUIMAGE_HISTOGRAM:
        {
            wrapper.title = @"Histogram";
            
            wrapper.minValue = 4.0;
            wrapper.maxValue = 32.0;
            wrapper.defaultValue = 16.0;
            
            wrapper.filter = [[GPUImageHistogramFilter alloc] initWithHistogramType:kGPUImageHistogramRGB];
        }; break;
        case GPUIMAGE_HISTOGRAM_EQUALIZATION:
        {
            wrapper.title = @"Histogram Equalization";
            
            wrapper.minValue = 4.0;
            wrapper.maxValue = 32.0;
            wrapper.defaultValue = 16.0;
            
            wrapper.filter = [[GPUImageHistogramEqualizationFilter alloc] initWithHistogramType:kGPUImageHistogramLuminance];
        }; break;
        case GPUIMAGE_THRESHOLD:
        {
            wrapper.title = @"Luminance Threshold";
            
            wrapper.minValue = 0.0;
            wrapper.maxValue = 1.0;
            wrapper.defaultValue = 0.5;
            
            wrapper.filter = [[GPUImageLuminanceThresholdFilter alloc] init];
        }; break;
        case GPUIMAGE_ADAPTIVETHRESHOLD:
        {
            wrapper.title = @"Adaptive Threshold";
            
            wrapper.minValue = 1.0;
            wrapper.maxValue = 20.0;
            wrapper.defaultValue = 1.0;
            
            wrapper.filter = [[GPUImageAdaptiveThresholdFilter alloc] init];
        }; break;
        case GPUIMAGE_AVERAGELUMINANCETHRESHOLD:
        {
            wrapper.title = @"Avg. Lum. Threshold";
            
            wrapper.minValue = 0.0;
            wrapper.maxValue = 2.0;
            wrapper.defaultValue = 1.0;
            
            wrapper.filter = [[GPUImageAverageLuminanceThresholdFilter alloc] init];
        }; break;
        case GPUIMAGE_CROP:
        {
            wrapper.title = @"Crop";
            
            wrapper.minValue = 0.2;
            wrapper.maxValue = 1.0;
            wrapper.defaultValue = 0.5;
            
            wrapper.filter = [[GPUImageCropFilter alloc] initWithCropRegion:CGRectMake(0.0, 0.0, 1.0, 0.25)];
        }; break;
        case GPUIMAGE_TRANSFORM:
        {
            wrapper.title = @"Transform (2-D)";
            
            wrapper.minValue = 0.0;
            wrapper.maxValue = 6.28;
            wrapper.defaultValue = 2.0;
            
            wrapper.filter = [[GPUImageTransformFilter alloc] init];
            [(GPUImageTransformFilter *)wrapper.filter setAffineTransform:CGAffineTransformMakeRotation(2.0)];
            //            [(GPUImageTransformFilter *)filter setIgnoreAspectRatio:YES];
        }; break;
        case GPUIMAGE_TRANSFORM3D:
        {
            wrapper.title = @"Transform (3-D)";
            
            wrapper.minValue = 0.0;
            wrapper.maxValue = 6.28;
            wrapper.defaultValue = 0.75;
            
            wrapper.filter = [[GPUImageTransformFilter alloc] init];
            CATransform3D perspectiveTransform = CATransform3DIdentity;
            perspectiveTransform.m34 = 0.4;
            perspectiveTransform.m33 = 0.4;
            perspectiveTransform = CATransform3DScale(perspectiveTransform, 0.75, 0.75, 0.75);
            perspectiveTransform = CATransform3DRotate(perspectiveTransform, 0.75, 0.0, 1.0, 0.0);
            
            [(GPUImageTransformFilter *)wrapper.filter setTransform3D:perspectiveTransform];
        }; break;
        case GPUIMAGE_SOBELEDGEDETECTION:
        {
            wrapper.title = @"Sobel Edge Detection";
            
            wrapper.minValue = 0.0;
            wrapper.maxValue = 1.0;
            wrapper.defaultValue = 0.25;
            
            wrapper.filter = [[GPUImageSobelEdgeDetectionFilter alloc] init];
        }; break;
        case GPUIMAGE_XYGRADIENT:
        {
            wrapper.title = @"XY Derivative";
            
            wrapper.filter = [[GPUImageXYDerivativeFilter alloc] init];
        }; break;
        case GPUIMAGE_HARRISCORNERDETECTION:
        {
            wrapper.title = @"Harris Corner Detection";
            
            wrapper.minValue = 0.01;
            wrapper.maxValue = 0.70;
            wrapper.defaultValue = 0.20;
            
            wrapper.filter = [[GPUImageHarrisCornerDetectionFilter alloc] init];
            [(GPUImageHarrisCornerDetectionFilter *)wrapper.filter setThreshold:0.20];
        }; break;
        case GPUIMAGE_NOBLECORNERDETECTION:
        {
            wrapper.title = @"Noble Corner Detection";
            
            wrapper.minValue = 0.01;
            wrapper.maxValue = 0.70;
            wrapper.defaultValue = 0.20;
            
            wrapper.filter = [[GPUImageNobleCornerDetectionFilter alloc] init];
            [(GPUImageNobleCornerDetectionFilter *)wrapper.filter setThreshold:0.20];
        }; break;
        case GPUIMAGE_SHITOMASIFEATUREDETECTION:
        {
            wrapper.title = @"Shi-Tomasi Feature Detection";
            
            wrapper.minValue = 0.01;
            wrapper.maxValue = 0.70;
            wrapper.defaultValue = 0.20;
            
            wrapper.filter = [[GPUImageShiTomasiFeatureDetectionFilter alloc] init];
            [(GPUImageShiTomasiFeatureDetectionFilter *)wrapper.filter setThreshold:0.20];
        }; break;
        case GPUIMAGE_HOUGHTRANSFORMLINEDETECTOR:
        {
            wrapper.title = @"Line Detection";
            
            wrapper.minValue = 0.2;
            wrapper.maxValue = 1.0;
            wrapper.defaultValue = 0.6;
            
            wrapper.filter = [[GPUImageHoughTransformLineDetector alloc] init];
            [(GPUImageHoughTransformLineDetector *)wrapper.filter setLineDetectionThreshold:0.60];
        }; break;
            
        case GPUIMAGE_PREWITTEDGEDETECTION:
        {
            wrapper.title = @"Prewitt Edge Detection";
            
            wrapper.minValue = 0.0;
            wrapper.maxValue = 1.0;
            wrapper.defaultValue = 1.0;
            
            wrapper.filter = [[GPUImagePrewittEdgeDetectionFilter alloc] init];
        }; break;
        case GPUIMAGE_CANNYEDGEDETECTION:
        {
            wrapper.title = @"Canny Edge Detection";
            
            wrapper.minValue = 0.0;
            wrapper.maxValue = 1.0;
            wrapper.defaultValue = 1.0;
            
            wrapper.filter = [[GPUImageCannyEdgeDetectionFilter alloc] init];
        }; break;
        case GPUIMAGE_THRESHOLDEDGEDETECTION:
        {
            wrapper.title = @"Threshold Edge Detection";
            
            wrapper.minValue = 0.0;
            wrapper.maxValue = 1.0;
            wrapper.defaultValue = 0.25;
            
            wrapper.filter = [[GPUImageThresholdEdgeDetectionFilter alloc] init];
        }; break;
        case GPUIMAGE_LOCALBINARYPATTERN:
        {
            wrapper.title = @"Local Binary Pattern";
            
            wrapper.minValue = 1.0;
            wrapper.maxValue = 5.0;
            wrapper.defaultValue = 1.0;
            
            wrapper.filter = [[GPUImageLocalBinaryPatternFilter alloc] init];
        }; break;
        case GPUIMAGE_BUFFER:
        {
            wrapper.title = @"Image Buffer";
            
            wrapper.filter = [[GPUImageBuffer alloc] init];
        }; break;
        case GPUIMAGE_LOWPASS:
        {
            wrapper.title = @"Low Pass";
            
            wrapper.minValue = 0.0;
            wrapper.maxValue = 1.0;
            wrapper.defaultValue = 0.5;
            
            wrapper.filter = [[GPUImageLowPassFilter alloc] init];
        }; break;
        case GPUIMAGE_HIGHPASS:
        {
            wrapper.title = @"High Pass";
            
            wrapper.minValue = 0.0;
            wrapper.maxValue = 1.0;
            wrapper.defaultValue = 0.5;
            
            wrapper.filter = [[GPUImageHighPassFilter alloc] init];
        }; break;
        case GPUIMAGE_MOTIONDETECTOR:
        {
            wrapper.title = @"Motion Detector";
            
            wrapper.minValue = 0.0;
            wrapper.maxValue = 1.0;
            wrapper.defaultValue = 0.5;
            
            wrapper.filter = [[GPUImageMotionDetector alloc] init];
        }; break;
        case GPUIMAGE_SKETCH:
        {
            wrapper.title = @"Sketch";
            
            wrapper.minValue = 0.0;
            wrapper.maxValue = 1.0;
            wrapper.defaultValue = 0.25;
            
            wrapper.filter = [[GPUImageSketchFilter alloc] init];
        }; break;
        case GPUIMAGE_THRESHOLDSKETCH:
        {
            wrapper.title = @"Threshold Sketch";
            
            wrapper.minValue = 0.0;
            wrapper.maxValue = 1.0;
            wrapper.defaultValue = 0.25;
            
            wrapper.filter = [[GPUImageThresholdSketchFilter alloc] init];
        }; break;
        case GPUIMAGE_TOON:
        {
            wrapper.title = @"Toon";
            
            wrapper.filter = [[GPUImageToonFilter alloc] init];
        }; break;
        case GPUIMAGE_SMOOTHTOON:
        {
            wrapper.title = @"Smooth Toon";
            
            wrapper.minValue = 1.0;
            wrapper.maxValue = 6.0;
            wrapper.defaultValue = 1.0;
            
            wrapper.filter = [[GPUImageSmoothToonFilter alloc] init];
        }; break;
        case GPUIMAGE_TILTSHIFT:
        {
            wrapper.title = @"Tilt Shift";
            
            wrapper.minValue = 0.2;
            wrapper.maxValue = 0.8;
            wrapper.defaultValue = 0.5;
            
            wrapper.filter = [[GPUImageTiltShiftFilter alloc] init];
            [(GPUImageTiltShiftFilter *)wrapper.filter setTopFocusLevel:0.4];
            [(GPUImageTiltShiftFilter *)wrapper.filter setBottomFocusLevel:0.6];
            [(GPUImageTiltShiftFilter *)wrapper.filter setFocusFallOffRate:0.2];
        }; break;
        case GPUIMAGE_CGA:
        {
            wrapper.title = @"CGA Colorspace";
            
            wrapper.filter = [[GPUImageCGAColorspaceFilter alloc] init];
        }; break;
        case GPUIMAGE_CONVOLUTION:
        {
            wrapper.title = @"3x3 Convolution";
            
            wrapper.filter = [[GPUImage3x3ConvolutionFilter alloc] init];
            
            [(GPUImage3x3ConvolutionFilter *)wrapper.filter setConvolutionKernel:(GPUMatrix3x3){
                {-1.0f,  0.0f, 1.0f},
                {-2.0f, 0.0f, 2.0f},
                {-1.0f,  0.0f, 1.0f}
            }];
        }; break;
        case GPUIMAGE_EMBOSS:
        {
            wrapper.title = @"Emboss";
            
            wrapper.minValue = 0.0;
            wrapper.maxValue = 5.0;
            wrapper.defaultValue = 1.0;
            
            wrapper.filter = [[GPUImageEmbossFilter alloc] init];
        }; break;
        case GPUIMAGE_LAPLACIAN:
        {
            wrapper.title = @"Laplacian";
            
            wrapper.filter = [[GPUImageLaplacianFilter alloc] init];
        }; break;
        case GPUIMAGE_POSTERIZE:
        {
            wrapper.title = @"Posterize";
            
            wrapper.minValue = 1.0;
            wrapper.maxValue = 20.0;
            wrapper.defaultValue = 10.0;
            
            wrapper.filter = [[GPUImagePosterizeFilter alloc] init];
        }; break;
        case GPUIMAGE_SWIRL:
        {
            wrapper.title = @"Swirl";
            
            wrapper.minValue = 0.0;
            wrapper.maxValue = 2.0;
            wrapper.defaultValue = 1.0;
            
            wrapper.filter = [[GPUImageSwirlFilter alloc] init];
        }; break;
        case GPUIMAGE_BULGE:
        {
            wrapper.title = @"Bulge";
            
            wrapper.minValue = -1.0;
            wrapper.maxValue = 1.0;
            wrapper.defaultValue = 0.5;
            
            wrapper.filter = [[GPUImageBulgeDistortionFilter alloc] init];
        }; break;
        case GPUIMAGE_SPHEREREFRACTION:
        {
            wrapper.title = @"Sphere Refraction";
            
            wrapper.minValue = 0.0;
            wrapper.maxValue = 1.0;
            wrapper.defaultValue = 0.15;
            
            wrapper.filter = [[GPUImageSphereRefractionFilter alloc] init];
            [(GPUImageSphereRefractionFilter *)wrapper.filter setRadius:0.15];
        }; break;
        case GPUIMAGE_GLASSSPHERE:
        {
            wrapper.title = @"Glass Sphere";
            
            wrapper.minValue = 0.0;
            wrapper.maxValue = 1.0;
            wrapper.defaultValue = 0.15;
            
            wrapper.filter = [[GPUImageGlassSphereFilter alloc] init];
            [(GPUImageGlassSphereFilter *)wrapper.filter setRadius:0.15];
        }; break;
        case GPUIMAGE_PINCH:
        {
            wrapper.title = @"Pinch";
            
            wrapper.minValue = -2.0;
            wrapper.maxValue = 2.0;
            wrapper.defaultValue = 0.5;
            
            wrapper.filter = [[GPUImagePinchDistortionFilter alloc] init];
        }; break;
        case GPUIMAGE_STRETCH:
        {
            wrapper.title = @"Stretch";
            
            wrapper.filter = [[GPUImageStretchDistortionFilter alloc] init];
        }; break;
        case GPUIMAGE_DILATION:
        {
            wrapper.title = @"Dilation";
            
            wrapper.filter = [[GPUImageRGBDilationFilter alloc] initWithRadius:4];
        }; break;
        case GPUIMAGE_EROSION:
        {
            wrapper.title = @"Erosion";
            
            wrapper.filter = [[GPUImageRGBErosionFilter alloc] initWithRadius:4];
        }; break;
        case GPUIMAGE_OPENING:
        {
            wrapper.title = @"Opening";
            
            wrapper.filter = [[GPUImageRGBOpeningFilter alloc] initWithRadius:4];
        }; break;
        case GPUIMAGE_CLOSING:
        {
            wrapper.title = @"Closing";
            
            wrapper.filter = [[GPUImageRGBClosingFilter alloc] initWithRadius:4];
        }; break;
            
        case GPUIMAGE_PERLINNOISE:
        {
            wrapper.title = @"Perlin Noise";
            
            wrapper.minValue = 1.0;
            wrapper.maxValue = 30.0;
            wrapper.defaultValue = 8.0;
            
            wrapper.filter = [[GPUImagePerlinNoiseFilter alloc] init];
        }; break;
        case GPUIMAGE_MOSAIC:
        {
            wrapper.title = @"Mosaic";
            
            wrapper.minValue = 0.002;
            wrapper.maxValue = 0.05;
            wrapper.defaultValue = 0.025;
            
            wrapper.filter = [[GPUImageMosaicFilter alloc] init];
            [(GPUImageMosaicFilter *)wrapper.filter setTileSet:@"squares.png"];
            [(GPUImageMosaicFilter *)wrapper.filter setColorOn:NO];
            
        }; break;
        case GPUIMAGE_KUWAHARA:
        {
            wrapper.title = @"Kuwahara";
            
            wrapper.minValue = 3.0;
            wrapper.maxValue = 8.0;
            wrapper.defaultValue = 3.0;
            
            wrapper.filter = [[GPUImageKuwaharaFilter alloc] init];
        }; break;
        case GPUIMAGE_KUWAHARARADIUS3:
        {
            wrapper.title = @"Kuwahara (Radius 3)";
            
            wrapper.filter = [[GPUImageKuwaharaRadius3Filter alloc] init];
        }; break;
        case GPUIMAGE_VIGNETTE:
        {
            wrapper.title = @"Vignette";
            
            wrapper.minValue = 0.5;
            wrapper.maxValue = 0.9;
            wrapper.defaultValue = 0.75;
            
            wrapper.filter = [[GPUImageVignetteFilter alloc] init];
        }; break;
        case GPUIMAGE_GAUSSIAN:
        {
            wrapper.title = @"Gaussian Blur";
            
            wrapper.minValue = 0.0;
            wrapper.maxValue = 24.0;
            wrapper.defaultValue = 2.0;
            
            wrapper.filter = [[GPUImageGaussianBlurFilter alloc] init];
        }; break;
        case GPUIMAGE_BOXBLUR:
        {
            wrapper.title = @"Box Blur";
            
            wrapper.minValue = 0.0;
            wrapper.maxValue = 24.0;
            wrapper.defaultValue = 2.0;
            
            wrapper.filter = [[GPUImageBoxBlurFilter alloc] init];
        }; break;
        case GPUIMAGE_MEDIAN:
        {
            wrapper.title = @"Median";
            
            wrapper.filter = [[GPUImageMedianFilter alloc] init];
        }; break;
        case GPUIMAGE_MOTIONBLUR:
        {
            wrapper.title = @"Motion Blur";
            
            wrapper.minValue = 0.0;
            wrapper.maxValue = 180.0f;
            wrapper.defaultValue = 0.0;
            
            wrapper.filter = [[GPUImageMotionBlurFilter alloc] init];
        }; break;
        case GPUIMAGE_ZOOMBLUR:
        {
            wrapper.title = @"Zoom Blur";
            
            wrapper.minValue = 0.0;
            wrapper.maxValue = 2.5f;
            wrapper.defaultValue = 1.0;
            
            wrapper.filter = [[GPUImageZoomBlurFilter alloc] init];
        }; break;
        case GPUIMAGE_IOSBLUR:
        {
            wrapper.title = @"iOS 7 Blur";
            
            wrapper.filter = [[GPUImageiOSBlurFilter alloc] init];
        }; break;
        case GPUIMAGE_UIELEMENT:
        {
            wrapper.title = @"UI Element";
            
            wrapper.filter = [[GPUImageSepiaFilter alloc] init];
        }; break;
        case GPUIMAGE_GAUSSIAN_SELECTIVE:
        {
            wrapper.title = @"Selective Blur";
            
            wrapper.minValue = 0.0;
            wrapper.maxValue = .75f;
            wrapper.defaultValue = 40.0/320.0;
            
            wrapper.filter = [[GPUImageGaussianSelectiveBlurFilter alloc] init];
            [(GPUImageGaussianSelectiveBlurFilter*)wrapper.filter setExcludeCircleRadius:40.0/320.0];
        }; break;
        case GPUIMAGE_GAUSSIAN_POSITION:
        {
            wrapper.title = @"Selective Blur";
            
            wrapper.minValue = 0.0;
            wrapper.maxValue = .75f;
            wrapper.defaultValue = 40.0/320.0;
            
            wrapper.filter = [[GPUImageGaussianBlurPositionFilter alloc] init];
            [(GPUImageGaussianBlurPositionFilter*)wrapper.filter setBlurRadius:40.0/320.0];
        }; break;
        case GPUIMAGE_BILATERAL:
        {
            wrapper.title = @"Bilateral Blur";
            
            wrapper.minValue = 0.0;
            wrapper.maxValue = 10.0;
            wrapper.defaultValue = 1.0;
            
            wrapper.filter = [[GPUImageBilateralFilter alloc] init];
        }; break;
        case GPUIMAGE_FILTERGROUP:
        {
            wrapper.title = @"Filter Group";
            
            wrapper.defaultValue = 0.05;
            wrapper.minValue = 0.0;
            wrapper.maxValue = 0.3;
            
            wrapper.filter = [[GPUImageFilterGroup alloc] init];
            
            GPUImageSepiaFilter *sepiaFilter = [[GPUImageSepiaFilter alloc] init];
            [(GPUImageFilterGroup *)wrapper.filter addFilter:sepiaFilter];
            
            GPUImagePixellateFilter *pixellateFilter = [[GPUImagePixellateFilter alloc] init];
            [(GPUImageFilterGroup *)wrapper.filter addFilter:pixellateFilter];
            
            [sepiaFilter addTarget:pixellateFilter];
            [(GPUImageFilterGroup *)wrapper.filter setInitialFilters:[NSArray arrayWithObject:sepiaFilter]];
            [(GPUImageFilterGroup *)wrapper.filter setTerminalFilter:pixellateFilter];
        }; break;
            
        default: break;
    }
    
    NSAssert(nil != wrapper.filter, @"Filter is nil!");
    [wrapper updateFilterWithValue:wrapper.defaultValue];
    
    return wrapper;
}

@end
