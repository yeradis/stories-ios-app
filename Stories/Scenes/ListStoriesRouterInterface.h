#import "ListStoriesCommon.h"

@protocol ListStoriesRouterInput
- (void)navigateToSomewhere;
- (void)passDataToNextScene:(UIStoryboardSegue *)segue;
- (void)passDataToSomewhereScene:(UIStoryboardSegue *)segue;
@end
