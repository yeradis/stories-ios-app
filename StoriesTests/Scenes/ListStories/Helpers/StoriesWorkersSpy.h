#import "ListStoriesCommon.h"

@interface StoriesWorkersSpy : StoriesWorker

@property (nonatomic) BOOL fetchStoriesCalled;
-(void) fetchStoriesWithCompletionBlock:(StoriesBlock) block;
@end
