#ifndef StoryProtocol_h
#define StoryProtocol_h

#import <UIKit/UIKit.h>
#import "StoryModelProtocol.h"

typedef void (^WSFinishedBlockWithImage)(UIImage* responseImage, NSError* error);

@protocol StoryProtocol

- (void) fetchCoverImageForStory:(id<StoryModelProtocol>) story completionBlock:(WSFinishedBlockWithImage) block;

@end

#endif /* StoryProtocol_h */
