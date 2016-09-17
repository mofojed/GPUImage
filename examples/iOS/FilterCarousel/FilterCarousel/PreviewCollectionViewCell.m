//
//  PreviewCollectionViewCell.m
//  FilterCarousel
//
//  Created by Mike Bender on 2016-09-16.
//  Copyright © 2016 Mike Bender. All rights reserved.
//

#import "PreviewCollectionViewCell.h"

@implementation PreviewCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.gpuImageView.fillMode = kGPUImageFillModePreserveAspectRatioAndFill;
}

@end
