#import "StoryAPI.h"
@import AFNetworking;
@import AFNetworking.AFImageDownloader;

@implementation StoryAPI

-(void) fetchCoverImageForStory:(id<StoryModelProtocol>)story completionBlock:(WSFinishedBlockWithImage)block {
    if (block) {
        /* 
         Images are cached on disk using standard NSURLCache built in iOS,
         meaning that if your responses include proper cache headers, 
         those items should end up on disk in the cache.
         
         Either the Cache-Control header or the Expires header MUST be in the 
         HTTP response header from the server in order for the client to cache it
         */
        NSURL *imageURL = [NSURL URLWithString:story.coverURL];
        NSURLRequest *imageRequest = [NSURLRequest requestWithURL:imageURL
                                                      cachePolicy:NSURLRequestReturnCacheDataElseLoad
                                                  timeoutInterval:3600];
        
        //Use the image from the image cache if it exists
        UIImage *cachedImage = [UIImage imageWithData:[[AFImageDownloader defaultURLCache] cachedResponseForRequest:imageRequest].data];
        
        if (cachedImage) {
            block(cachedImage, nil);
        } else {
            [[AFImageDownloader defaultInstance] downloadImageForURLRequest:imageRequest
                                           success:^(NSURLRequest * _Nonnull request,
                                                     NSHTTPURLResponse * _Nullable response,
                                                     UIImage * _Nonnull responseObject) {
                                               block(responseObject,nil);
                                           } failure:^(NSURLRequest * _Nonnull request,
                                                       NSHTTPURLResponse * _Nullable response,
                                                       NSError * _Nonnull error) {
                                               block(nil,error);
                                           }];
            
        }
    }
}

@end
