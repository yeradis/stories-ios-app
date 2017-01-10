#import "ListStoriesViewController.h"
#import "ListStoriesCellViewController.h"

@interface ListStoriesViewController ()
@property (strong, atomic) ListStoriesViewModel* viewModel;
@end

@implementation ListStoriesViewController

#pragma mark - Object lifecycle

- (void)awakeFromNib
{
  [super awakeFromNib];
    self.title = @"Stories from the NYTimes";
  [[ListStoriesConfigurator sharedInstance] configure:self];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"ListStoriesCellViewController" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"storyCell"];
  
    [self fetchStoriesOnLoad];
}

#pragma mark - Event handling

- (void)fetchStoriesOnLoad
{
  // NOTE: Ask the Interactor to do some work
  ListStoriesRequest *request = [[ListStoriesRequest alloc] init:[[StoriesAPI alloc] init]];
  [self.output fetchStories:request];
}

#pragma mark - Display logic

- (void)displayStories:(ListStoriesViewModel *)viewModel {
    self.viewModel = viewModel;
    [self.collectionView reloadData];
}

#pragma mark - Collection view delegate

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (self.viewModel && self.viewModel.stories) {
        return self.viewModel.stories.count;
    }
    return 0;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ListStoriesCellViewController* cell = (ListStoriesCellViewController*)[collectionView dequeueReusableCellWithReuseIdentifier:@"storyCell" forIndexPath:indexPath];
        
    Story* story = [self.viewModel.stories objectAtIndex:indexPath.row];
    
    [cell processStory:story];
    return cell;
}


@end
