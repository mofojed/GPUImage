//
//  ViewController.m
//  FilterCarousel
//
//  Created by Mike Bender on 2016-09-16.
//  Copyright © 2016 Mike Bender. All rights reserved.
//

#import "ViewController.h"
#import "PreviewCollectionViewCell.h"
#import "GPUImageFilterFactory.h"

@interface ViewController () <UICollectionViewDelegate, UICollectionViewDataSource>

@property (weak, nonatomic) IBOutlet UICollectionView *previewCollectionView;
@property (weak, nonatomic) IBOutlet GPUImageView *gpuImageView;
@property (weak, nonatomic) IBOutlet UIView *savedView;
@property (weak, nonatomic) IBOutlet UILabel *filterLabel;

@property (weak, nonatomic) IBOutlet UISlider *slider;
@property (weak, nonatomic) IBOutlet UIButton *retakeButton;
@property (weak, nonatomic) IBOutlet UIButton *shutterButton;
@property (weak, nonatomic) IBOutlet UIButton *flipButton;
@property (weak, nonatomic) IBOutlet UIButton *saveButton;

@property GPUImageStillCamera *camera;

/** The filters to select from */
@property NSArray<GPUImageFilterWrapper*> *filters;

@property GPUImageFilterWrapper *filter;

/** The captured image after taking a picture */
@property UIImage *capturedImage;
@property GPUImagePicture *capturedImageSource;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initCamera];
    
    [self initFilters];
    
    [self selectFilter:[self.filters firstObject]];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self.camera startCameraCapture];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [self.camera stopCameraCapture];
}

- (void)initCamera {
    self.camera = [[GPUImageStillCamera alloc] initWithSessionPreset:AVCaptureSessionPresetHigh cameraPosition:AVCaptureDevicePositionBack];
    self.camera.outputImageOrientation = UIInterfaceOrientationPortrait;
}

- (void)initFilters {
    NSMutableArray *filters = [[NSMutableArray alloc] initWithCapacity:GPUIMAGE_NUMFILTERS];
    for (NSInteger i = 0; i < GPUIMAGE_NUMFILTERS; i++) {
        [filters addObject:[GPUImageFilterFactory filterForType:(GPUImageCarouselFilterType)i]];
    }
    
    self.filters = filters;
}

- (void)selectFilter:(GPUImageFilterWrapper*)wrappedFilter {
    [self.filter.filter removeTarget:self.gpuImageView];
    
    self.filter = wrappedFilter;
    
    [self.filter.filter addTarget:self.gpuImageView];
    
    self.filterLabel.text = self.filter.title;
    if (self.filter.minValue == self.filter.maxValue) {
        [UIView animateWithDuration:0.2 animations:^{
            self.slider.alpha = 0;
        }];
    } else {
        [self.slider setMinimumValue:self.filter.minValue];
        [self.slider setMaximumValue:self.filter.maxValue];
        [self.slider setValue:self.filter.defaultValue animated:YES];
        [UIView animateWithDuration:0.2 animations:^{
            self.slider.alpha = 1;
        }];
    }
    
    [self updateMainView];
}

- (void)updateMainView {
    [GPUImageView class];   // Needed so IB can use GPUImageView...
    
    self.gpuImageView.fillMode = kGPUImageFillModePreserveAspectRatioAndFill;
    
    if (nil != self.capturedImageSource) {
        [self.capturedImageSource addTarget:self.filter.filter];
        [self.capturedImageSource processImage];
    } else {
        [self.camera addTarget:self.filter.filter];
    }
}

#pragma mark - IBActions
- (IBAction)retakePhoto:(id)sender {
    self.flipButton.hidden = NO;
    self.saveButton.hidden = YES;
    self.shutterButton.hidden = NO;
    self.retakeButton.hidden = YES;
    
    self.capturedImage = nil;
    self.capturedImageSource = nil;
    [self.previewCollectionView reloadData];
    [self updateMainView];
}

- (IBAction)takePhoto:(id)sender {
    self.flipButton.hidden = YES;
    self.saveButton.hidden = NO;
    self.shutterButton.hidden = YES;
    self.retakeButton.hidden = NO;
    
    GPUImageFilter *cleanFilter = [[GPUImageFilter alloc] init];
    [self.camera addTarget:cleanFilter];
    
    [self.camera capturePhotoAsImageProcessedUpToFilter:cleanFilter withOrientation:UIImageOrientationUp withCompletionHandler:^(UIImage *processedImage, NSError *error) {
        [self.camera removeTarget:cleanFilter];
        
        if (error) {
            NSLog(@"There was an error: %@", error);
            return;
        }
        
        self.capturedImage = processedImage;
        self.capturedImageSource = [[GPUImagePicture alloc] initWithImage:self.capturedImage];
        
        [self.camera removeAllTargets];
        
        [self updateMainView];
        
        [self.previewCollectionView reloadData];
    }];
}

/** Switches between front and back camera */
- (IBAction)flipCamera:(id)sender {
    [self.camera stopCameraCapture];
    [self.camera removeAllTargets];
    
    AVCaptureDevicePosition position = AVCaptureDevicePositionBack;
    if (AVCaptureDevicePositionBack == self.camera.cameraPosition) {
        position = AVCaptureDevicePositionFront;
    }
    self.camera = [[GPUImageStillCamera alloc] initWithSessionPreset:AVCaptureSessionPresetHigh cameraPosition:position];
    self.camera.outputImageOrientation = UIInterfaceOrientationPortrait;
    
    [self.camera startCameraCapture];
    
    [self updateMainView];
    
    [self.previewCollectionView reloadData];
}

- (IBAction)sliderChanged:(UISlider*)slider {
    [self.filter updateFilterWithValue:slider.value];
    
    if (nil != self.capturedImageSource) {
        [self.capturedImageSource processImage];
    }
}

- (IBAction)savePhoto:(id)sender {
    GPUImageOutput<GPUImageInput> *filter = self.filter.filter;
    UIImage *filteredImage = [filter imageByFilteringImage:self.capturedImage];
    UIImageWriteToSavedPhotosAlbum(filteredImage, nil, nil, nil);
    
    [UIView animateWithDuration:0.5 animations:^{
        self.savedView.alpha = 1;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.5 animations:^{
            self.savedView.alpha = 0.95;
        } completion:^(BOOL finished) {
            self.savedView.alpha = 0;
            [self retakePhoto:sender];
        }];
    }];
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.filters.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    PreviewCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Preview" forIndexPath:indexPath];
    
    // Cell is configured in the willDisplayCell method
    
    return cell;
}

#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath {
    PreviewCollectionViewCell *previewCell = (PreviewCollectionViewCell*)cell;
    GPUImageFilterWrapper *wrapper = self.filters[indexPath.row];
    
    [wrapper.filter addTarget:previewCell.gpuImageView];
    
    if (nil != self.capturedImageSource) {
        [self.capturedImageSource addTarget:wrapper.filter];
        [wrapper.filter useNextFrameForImageCapture];
        [self.capturedImageSource processImage];
    } else {
        [self.camera addTarget:wrapper.filter];
    }
    previewCell.nameLabel.text = wrapper.title;
}

- (void)collectionView:(UICollectionView *)collectionView didEndDisplayingCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath {
    PreviewCollectionViewCell *previewCell = (PreviewCollectionViewCell*)cell;
    GPUImageFilterWrapper *wrapper = self.filters[indexPath.row];
    [wrapper.filter removeTarget:previewCell.gpuImageView];
    [self.camera removeTarget:wrapper.filter];
    [self.capturedImageSource removeTarget:wrapper.filter];
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [self selectFilter:self.filters[indexPath.row]];
}

@end
