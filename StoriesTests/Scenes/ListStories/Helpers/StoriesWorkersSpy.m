//
//  StoriesWorkersSpy.m
//  Stories
//
//  Created by yeradis on 09/01/2017.
//  Copyright © 2017 yeradis. All rights reserved.
//

#import "StoriesWorkersSpy.h"

@implementation StoriesWorkersSpy

-(void) fetchStoriesWithCompletionBlock:(StoriesBlock)block {
    self.fetchStoriesCalled = YES;
    block(@[]);
}

@end
