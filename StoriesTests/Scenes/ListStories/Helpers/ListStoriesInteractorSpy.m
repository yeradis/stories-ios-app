#import "ListStoriesInteractorSpy.h"

@implementation ListStoriesInteractorOutputSpy

-(void) presentStories:(ListStoriesResponse *)response {
    self.presentStoriesCalled = YES;
}

@end

@implementation ListStoriesInteractorInputSpy

-(void) fetchStories:(ListStoriesRequest *)request {
    self.fetchStoriesCalled = YES;
}

@end
