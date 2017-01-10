#import "ListStoriesCellViewController.h"
#import "StoryProtocol.h"
#import "StoryModelProtocol.h"
#import "StoryWorker.h"

@interface ListStoriesCellViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *coverImage;
@property (weak, nonatomic) IBOutlet UILabel *abstractLabel;
@property (weak, nonatomic) IBOutlet UILabel *authorLabel;
@end

@implementation ListStoriesCellViewController

#pragma mark - Object lifecycle

- (void)awakeFromNib {
    [super awakeFromNib];
    [[ListStoriesCellConfigurator sharedInstance] configure:self];
}

#pragma mark - Event handling

- (void)processStory:(id<StoryModelProtocol>) story
{
    // NOTE: Ask the Interactor to do some work
    ListStoriesCellRequest *request = [[ListStoriesCellRequest alloc] init:story];
    [self.output processStory:request];
}

#pragma mark - Display logic

- (void)displayStory:(ListStoriesCellViewModel *)viewModel
{
    // NOTE: Display the result from the Presenter
    if (viewModel.coverImage) {
        self.coverImage.image = viewModel.coverImage;
    } 
    self.abstractLabel.text = viewModel.abstract;
    self.authorLabel.text = viewModel.author;
}

@end
