//
//  GPUImageFilterFactory.h
//  FilterCarousel
//
//  Created by Mike Bender on 2016-09-16.
//  Copyright © 2016 Mike Bender. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GPUImageFilterWrapper.h"

/** Factory to create instances of GPUImageFilters */
@interface GPUImageFilterFactory : NSObject

+ (GPUImageFilterWrapper*)filterForType:(GPUImageCarouselFilterType)filterType;

@end
