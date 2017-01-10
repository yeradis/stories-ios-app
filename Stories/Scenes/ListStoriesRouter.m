#import "ListStoriesRouter.h"

@interface ListStoriesRouter ()
@end

@implementation ListStoriesRouter

#pragma mark - Routing

#pragma mark - Navigation

- (void)navigateToSomewhere
{
  // NOTE: Teach the router how to navigate to another scene. Some examples follow:
  
  // 1. Trigger a storyboard segue
  // [self.viewController performSegueWithIdentifier:@"ShowSomewhereScene" sender:nil];
  
  // 2. Present another view controller programmatically
  // [self.viewController presentViewController:someWhereViewController animated:YES completion:nil];
  
  // 3. Ask the navigation controller to push another view controller onto the stack
  // [self.viewController.navigationController pushViewController:someWhereViewController animated:YES];
  
  // 4. Present a view controller from a different storyboard
  // UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"OtherThanMain" bundle:nil];
  // SomeWhereViewController* someWhereViewController = [storyboard instantiateInitialViewController];
  // [self.viewController.navigationController pushViewController:someWhereViewController animated:YES];
}

#pragma mark - Communication

- (void)passDataToNextScene:(UIStoryboardSegue *)segue
{
  // NOTE: Teach the router which scenes it can communicate with
  
  if ([segue.identifier isEqualToString:@"ShowSomewhereScene"]) {
    [self passDataToSomewhereScene: segue];
  }
}

- (void)passDataToSomewhereScene:(UIStoryboardSegue *)segue
{
  // NOTE: Teach the router how to pass data to the next scene
  
  // SomeWhereViewController *someWhereViewController = segue.destinationViewController;
  // someWhereViewController.output.name = self.viewController.output.name;
}

@end
