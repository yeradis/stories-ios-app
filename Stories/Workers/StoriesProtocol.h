#ifndef StoriesProtocol_h
#define StoriesProtocol_h

#import "Story.h"
#import "StoryModelProtocol.h"

typedef void (^WSFinishedBlockWithStories)(NSArray<StoryModelProtocol>* stories, NSError *error);
typedef void (^WSFinishedBlockWithDictionary)(NSDictionary *responseDictionary, NSError *error);

@protocol StoriesProtocol

-(void) fetchStoriesWithCompletionBlock:(WSFinishedBlockWithStories) block;
- (void) fetchStoriesDictionaryWithCompletionBlock:(WSFinishedBlockWithDictionary) block;
- (void) fetchStoriesDictionaryWithUrl:(NSURL*) url
                      params:(NSDictionary*) params
             completionBlock:(WSFinishedBlockWithDictionary)block;

- (Story*) storyFromDictionary:(NSDictionary*) dic;
- (NSArray<StoryModelProtocol>*) storiesFromDictionary:(NSDictionary*) dic;

@end

#endif /* StoriesProtocol_h */
