#import <UIKit/UIKit.h>
#import "StoryProtocol.h"
#import "StoryModelProtocol.h"

typedef void (^StoryCoverImageBlock)(UIImage* cover);

@interface StoryWorker : NSObject

@property (strong, nonatomic) id<StoryModelProtocol> story;
@property (strong, nonatomic) id<StoryProtocol> storyClient;


-(id) init:(id<StoryProtocol>)storyClient story:(id<StoryModelProtocol>) story;
-(void) fetchStoryCoverImageWithCompletionBlock:(StoryCoverImageBlock)block;

@end
