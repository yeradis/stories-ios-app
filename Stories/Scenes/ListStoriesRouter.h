#import "ListStoriesCommon.h"

@class ListStoriesViewController;

@interface ListStoriesRouter: NSObject <ListStoriesRouterInput>
@property (weak, nonatomic) ListStoriesViewController *viewController;
@end
