#import "ListStoriesCellCommon.h"

@class ListStoriesCellViewController;

@interface ListStoriesCellConfigurator: NSObject
+ (instancetype)sharedInstance;
- (void)configure:(ListStoriesCellViewController *)viewController;
@end
