#import "StoriesAPI.h"
#import <AFNetworking/AFNetworking.h>

NSString *const kWS_BaseURL = @"https://api.nytimes.com/svc/topstories/v2/home.json";
NSString *const kWS_BaseAPI_Key = @"GwCOGpRYu2klbGLGXMFjGxGbH7GnfAX7";

@implementation StoriesAPI

-(void) fetchStoriesWithCompletionBlock:(WSFinishedBlockWithStories)block {
    if (block) {
        [self fetchStoriesDictionaryWithCompletionBlock:^(NSDictionary *responseDictionary, NSError *error) {
            NSArray<StoryModelProtocol>* stories = nil;
            if (responseDictionary) {
                stories = [self storiesFromDictionary:responseDictionary];
            }
            block(stories,error);
        }];
    }
}

-(void) fetchStoriesDictionaryWithUrl:(NSURL *)url params:(NSDictionary *)params completionBlock:(WSFinishedBlockWithDictionary)block {
    if (block){
        NSLog(@"lets fetch some stories from: %@",url.absoluteString);
        if (url == nil) {
            NSError *error = [[NSError alloc] initWithDomain:@"API enpoing url should not be null" code:999 userInfo:nil];
            block(nil,error);
            return;
        }
        
        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
        [manager GET:url.absoluteString
          parameters:params
            progress:nil
             success:^(NSURLSessionTask *task, id responseObject) {
                 block(responseObject,nil);
             } failure:^(NSURLSessionTask *operation, NSError *error) {
                 block(nil,error);
             }];
        
    }

}

- (void) fetchStoriesDictionaryWithCompletionBlock:(WSFinishedBlockWithDictionary)block {
    if (block) {
        NSURL *url = [NSURL URLWithString:kWS_BaseURL];
        NSDictionary *params = @{@"api-key":kWS_BaseAPI_Key};
        [self fetchStoriesDictionaryWithUrl:url params:params completionBlock:^(NSDictionary *responseDictionary, NSError *error) {
            block(responseDictionary,error);
        }];
    }
}

- (Story*) storyFromDictionary:(NSDictionary *)dic {
    if (dic == nil) return nil;
    
    Story* story = [[Story alloc] init];
    story.author = dic[kItemByline];
    story.abstract = dic[kItemAbstract];
    if (dic[kItemMultimedia]) {
        story.coverURL = [dic[kItemMultimedia] firstObject][kItemUrl];
        for (NSDictionary* media in dic[kItemMultimedia]){
            if ([media[kItemFormat] isEqualToString:kItemMediaTypeSuperJumbo]){
                story.coverURL = media[kItemUrl];
            }
        }
    }
    
    return story;
}

- (NSArray<StoryModelProtocol>*) storiesFromDictionary:(NSDictionary*) dic;
{
    NSMutableArray<__kindof Story*> *stories = [[NSMutableArray alloc] initWithCapacity:0];
    
    for (NSDictionary* item in dic[@"results"]) {
        Story* story = [self storyFromDictionary:item];
        if (story) [stories addObject:story];
    }
    
    return [stories copy];
}

@end
