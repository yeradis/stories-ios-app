#import "StoryAPI.h"
#import <AFNetworking/AFNetworking.h>

@implementation StoryAPI

-(void) fetchCoverImageForStory:(id<StoryModelProtocol>)story completionBlock:(WSFinishedBlockWithImage)block {
    if (block) {
        /* Images are cached on disk using standard NSURLCache built in iOS, 
         meaning that if your responses include proper cache headers, 
         those items should end up on disk in the cache.*/
        NSURLRequest *imageRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:story.coverURL]
                                                      cachePolicy:NSURLRequestReturnCacheDataElseLoad
                                                  timeoutInterval:60];
        [[AFImageDownloader defaultInstance] downloadImageForURLRequest:imageRequest success:^(NSURLRequest * _Nonnull request, NSHTTPURLResponse * _Nullable response, UIImage * _Nonnull responseObject) {
            //UIImage *image = [UIImage imageWithData:[[AFImageDownloader defaultURLCache] cachedResponseForRequest:imageRequest].data];
            //if (image) {
                block(responseObject,nil);
            //}
        } failure:^(NSURLRequest * _Nonnull request, NSHTTPURLResponse * _Nullable response, NSError * _Nonnull error) {
            block(nil,error);
        }];

    }
}

@end
