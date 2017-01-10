#import "ListStoriesCommon.h"

@class ListStoriesRouter;

@interface ListStoriesViewController: UICollectionViewController <ListStoriesViewControllerInput, ListStoriesPresenterOutput,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (strong, nonatomic) id<ListStoriesViewControllerOutput> output;
@property (strong, nonatomic) ListStoriesRouter *router;
- (void)displayStories:(ListStoriesViewModel *)viewModel;
@end
