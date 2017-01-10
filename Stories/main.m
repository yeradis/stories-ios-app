#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "AppTestingDelegate.h"

int main(int argc, char * argv[]) {
    @autoreleasepool {
        Class appDelegateClass = NSClassFromString(@"AppTestingDelegate");
        if (!appDelegateClass)
            appDelegateClass = [AppDelegate class];
        return UIApplicationMain(argc, argv, nil, NSStringFromClass(appDelegateClass));
    }
}
