#import "ListStoriesViewController+Routing.h"

@implementation ListStoriesViewController (Routing)

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
  [self.router passDataToNextScene:segue];
}

@end
