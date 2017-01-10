#import "ListStoriesCellConfigurator.h"

@interface ListStoriesCellConfigurator ()
@end

@implementation ListStoriesCellConfigurator

#pragma mark - Object lifecycle

+ (instancetype)sharedInstance
{
  static dispatch_once_t predicate;
  static ListStoriesCellConfigurator *instance = nil;
  dispatch_once(&predicate, ^{instance = [[self alloc] init];});
  return instance;
}

#pragma mark - Configuration

- (void)configure:(ListStoriesCellViewController *)viewController
{
  ListStoriesCellPresenter *presenter = [[ListStoriesCellPresenter alloc] init];
  presenter.output = viewController;
  
  ListStoriesCellInteractor *interactor = [[ListStoriesCellInteractor alloc] init];
  interactor.output = presenter;
  
  viewController.output = interactor;
}

@end
