#import "ListStoriesCommon.h"

@interface ListStoriesInteractorOutputSpy : NSObject <ListStoriesInteractorOutput>
@property (nonatomic) BOOL presentStoriesCalled;

@end

@interface ListStoriesInteractorInputSpy : NSObject <ListStoriesInteractorInput>
@property (nonatomic) BOOL fetchStoriesCalled;
@end
