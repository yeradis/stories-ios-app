#import "ListStoriesConfigurator.h"

@interface ListStoriesConfigurator ()
@end

@implementation ListStoriesConfigurator

#pragma mark - Object lifecycle

+ (instancetype)sharedInstance
{
  static dispatch_once_t predicate;
  static ListStoriesConfigurator *instance = nil;
  dispatch_once(&predicate, ^{instance = [[self alloc] init];});
  return instance;
}

#pragma mark - Configuration

- (void)configure:(ListStoriesViewController *)viewController
{
  ListStoriesRouter *router = [[ListStoriesRouter alloc] init];
  router.viewController = viewController;
  
  ListStoriesPresenter *presenter = [[ListStoriesPresenter alloc] init];
  presenter.output = viewController;
  
  ListStoriesInteractor *interactor = [[ListStoriesInteractor alloc] init];
  interactor.output = presenter;
  
  viewController.output = interactor;
  viewController.router = router;
}

@end
