#import "ListStoriesCellPresenter.h"

@interface ListStoriesCellPresenter ()
@end

@implementation ListStoriesCellPresenter

#pragma mark - Presentation logic

- (void)presentStory:(ListStoriesCellResponse *)response
{
    // NOTE: Format the response from the Interactor and pass the result back to the View Controller
    
    ListStoriesCellViewModel *viewModel = [[ListStoriesCellViewModel alloc] init];
    viewModel.author = response.story.author;
    viewModel.abstract = response.story.abstract;
    viewModel.coverImage = response.coverImage;
    
    [self.output displayStory:viewModel];
}

@end
