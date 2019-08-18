// Copyright MyScript. All right reserved.

#import <Foundation/Foundation.h>
#import <iink/IINKIRenderTarget.h>


/**
 * The ImageDrawer converts rendering data into images in view e.g. for
 * integration into .docx exports.
 */
@protocol IINKIImageDrawer <IINKIRenderTarget>

@required

/**
 * Invoked before starting to draw an image.
 * This call is meant to enable preparation of the image destination in memory
 * (e.g. memory allocation).
 *
 * @param size the image size.
 */
- (void)prepareImage:(CGSize)size;

/**
 * Invoked once image drawing is over.
 * Requests saving the image to disk.
 *
 * @param path the image destination.
 */
- (void)saveImage:(nonnull NSString *)path;

@end
