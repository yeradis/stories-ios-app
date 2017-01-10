#import "ListStoriesCommon.h"

@interface ListStoriesPresenter: NSObject <ListStoriesPresenterInput, ListStoriesInteractorOutput>
@property (weak, nonatomic) id<ListStoriesPresenterOutput> output;
- (void)presentStories:(ListStoriesResponse *)response;
@end
