#ifndef StoryModelProtocol_h
#define StoryModelProtocol_h

#import <Foundation/Foundation.h>

@protocol StoryModelProtocol

@property (strong, atomic) NSString* author;
@property (strong, atomic) NSString* abstract;
@property (strong, atomic) NSString* coverURL;

@end

#endif /* StoryModelProtocol_h */
