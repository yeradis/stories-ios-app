#import "ListStoriesCellCommon.h"

@protocol ListStoriesCellInteractorInput
- (void)processStory:(ListStoriesCellRequest *)request;
@end

@protocol ListStoriesCellInteractorOutput
- (void)presentStory:(ListStoriesCellResponse *)response;
@end
