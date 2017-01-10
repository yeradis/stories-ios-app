#import "ListStoriesCellCommon.h"

@interface ListStoriesCellViewController: UICollectionViewCell <ListStoriesCellViewControllerInput, ListStoriesCellPresenterOutput>
@property (strong, nonatomic) id<ListStoriesCellViewControllerOutput> output;
- (void)displayStory:(ListStoriesCellViewModel *)viewModel;
- (void)processStory:(id<StoryModelProtocol>) story;

@end
