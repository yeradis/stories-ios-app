#import <UIKit/UIKit.h>
#import "StoriesProtocol.h"
#import "Story.h"

typedef void (^StoriesBlock)(NSArray<__kindof Story *> *storyList);

@interface StoriesWorker : NSObject

@property (strong, nonatomic) id<StoriesProtocol> stories;

-(id) init:(id<StoriesProtocol>) stories;
-(void) fetchStoriesWithCompletionBlock:(StoriesBlock) block;

@end
