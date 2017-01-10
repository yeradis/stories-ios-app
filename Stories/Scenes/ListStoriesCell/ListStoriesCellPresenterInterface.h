#import "ListStoriesCellCommon.h"

@protocol ListStoriesCellPresenterInput
- (void)presentStory:(ListStoriesCellResponse *)response;
@end

@protocol ListStoriesCellPresenterOutput
- (void)displayStory:(ListStoriesCellViewModel *)viewModel;
@end
