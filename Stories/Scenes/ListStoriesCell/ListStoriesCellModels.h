#import <UIKit/UIKit.h>
#import "StoryModelProtocol.h"

@interface ListStoriesCellRequest: NSObject
@property (strong, atomic) id<StoryModelProtocol> story;
-(id) init:(id<StoryModelProtocol>) story;
@end

@interface ListStoriesCellResponse: NSObject
@property (strong, atomic) id<StoryModelProtocol> story;
@property (strong, atomic) UIImage* coverImage;
@end

@interface ListStoriesCellViewModel: NSObject<StoryModelProtocol>
@property (strong, atomic) UIImage* coverImage;
@end
