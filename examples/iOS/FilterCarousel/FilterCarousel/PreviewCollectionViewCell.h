//
//  PreviewCollectionViewCell.h
//  FilterCarousel
//
//  Created by Mike Bender on 2016-09-16.
//  Copyright © 2016 Mike Bender. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GPUImage.h>

@interface PreviewCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet GPUImageView *gpuImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@end
