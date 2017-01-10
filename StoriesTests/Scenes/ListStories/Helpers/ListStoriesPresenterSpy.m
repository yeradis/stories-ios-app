#import "ListStoriesPresenterSpy.h"

@implementation ListStoriesPresenterOutputSpy

-(void) displayStories:(ListStoriesViewModel *)viewModel {
    self.displayStoriesCalled = YES;
}

@end

@implementation ListStoriesPresenterInputSpy

-(void) presentStories:(ListStoriesResponse *)response {
    self.presentStoriesCalled = YES;
}

@end
