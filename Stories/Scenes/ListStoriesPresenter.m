#import "ListStoriesPresenter.h"

@interface ListStoriesPresenter ()
@end

@implementation ListStoriesPresenter

#pragma mark - Presentation logic
- (void)presentStories:(ListStoriesResponse *)response {
  // NOTE: Format the response from the Interactor and pass the result back to the View Controller
  ListStoriesViewModel *viewModel = [[ListStoriesViewModel alloc] init:response.stories];
  [self.output displayStories:viewModel];
}

@end
