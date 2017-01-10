#ifndef StoriesProtocol_h
#define StoriesProtocol_h

#import "Story.h"
#import "StoryModelProtocol.h"

typedef void (^WSFinishedBlockWithDictionary)(NSDictionary *responseDictionary, NSError *error);

@protocol StoriesProtocol

- (void) fetchStoriesWithCompletionBlock:(WSFinishedBlockWithDictionary) block;
- (void) fetchStoriesWithUrl:(NSURL*) url
                      params:(NSDictionary*) params
             completionBlock:(WSFinishedBlockWithDictionary)block;

- (Story*) storyFromDictionary:(NSDictionary*) dic;
- (NSArray<StoryModelProtocol>*) storiesFromDictionary:(NSDictionary*) dic;

@end

#endif /* StoriesProtocol_h */
