#import "ListStoriesCellCommon.h"

@interface ListStoriesCellPresenter: NSObject <ListStoriesCellPresenterInput, ListStoriesCellInteractorOutput>
@property (weak, nonatomic) id<ListStoriesCellPresenterOutput> output;
- (void)presentStory:(ListStoriesCellResponse *)response;
@end
