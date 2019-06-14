// Copyright MyScript. All right reserved.

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import <iink/graphics/IINKIPath.h>


@class IINKRenderer;

/**
 * Represents the type of a layer
 */
typedef NS_OPTIONS(NSUInteger, IINKLayerType) {
  /** The layer that renders background items, such as guides. */
  IINKLayerTypeBackground = 1 << 0,
  /** The layer that renders the model. */
  IINKLayerTypeModel      = 1 << 1,
  /** The layer that renders temporary items. */
  IINKLayerTypeTemporary  = 1 << 2,
  /** The layer that renders capture strokes. */
  IINKLayerTypeCapture    = 1 << 3
};

/**
 * Represents a render target for the iink renderer.
 */
@protocol IINKIRenderTarget <NSObject>

@required

/**
 * Invalidates the given set of layers.
 *
 * @param renderer the renderer to which this render target has been bound.
 * @param layers the set of layers to invalidate.
 */
- (void)invalidate:(nonnull IINKRenderer *)renderer layers:(IINKLayerType)layers;

/**
 * Invalidates a specified rectangle area on the given set of layers. The
 * rectangle area is specified in pixel coordinates.
 *
 * @param renderer the renderer to which this render target has been bound.
 * @param area the invalidated rectangle area.
 * @param layers the set of layers to invalidate.
 */
- (void)invalidate:(nonnull IINKRenderer *)renderer area:(CGRect)area layers:(IINKLayerType)layers;

@end
