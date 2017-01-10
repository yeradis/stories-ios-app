#import "ListStoriesCommon.h"

@interface ListStoriesPresenterOutputSpy : NSObject<ListStoriesPresenterOutput>
@property (nonatomic) BOOL displayStoriesCalled;
@end

@interface ListStoriesPresenterInputSpy : NSObject<ListStoriesPresenterInput>
@property (nonatomic) BOOL presentStoriesCalled;
@end
