#import "ListStoriesCellCommon.h"

@interface ListStoriesCellInteractor: NSObject <ListStoriesCellInteractorInput, ListStoriesCellViewControllerOutput>
@property (strong, nonatomic) id<ListStoriesCellInteractorOutput> output;
- (void)processStory:(ListStoriesCellRequest *)request;
@end
