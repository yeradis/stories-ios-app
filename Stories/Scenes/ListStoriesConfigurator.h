#import "ListStoriesCommon.h"

@interface ListStoriesConfigurator: NSObject
+ (instancetype)sharedInstance;
- (void)configure:(ListStoriesViewController *)viewController;
@end
