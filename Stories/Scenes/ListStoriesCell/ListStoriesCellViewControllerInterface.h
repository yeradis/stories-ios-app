#import "ListStoriesCellCommon.h"

@protocol ListStoriesCellViewControllerInput
- (void)displayStory:(ListStoriesCellViewModel *)viewModel;
@end

@protocol ListStoriesCellViewControllerOutput
- (void)processStory:(ListStoriesCellRequest *)request;
@end
