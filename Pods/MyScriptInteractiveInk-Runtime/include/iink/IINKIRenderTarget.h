// Copyright @ MyScript. All rights reserved.

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import <iink/graphics/IINKIPath.h>
#import <iink/graphics/IINKICanvas.h>


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

@optional

/**
 * The device Pixel Density.
 */
@property (nonatomic,readonly) float pixelDensity;

/**
 * Requests the creation of an offscreen render surface (e.g. a bitmap), and
 * returns a unique identifier for that surface.
 *
 * @note createOffscreenRenderCanvas() will be called with this identifier, to
 * request drawing of the associated surface.
 *
 * @param width the width of the surface to create (in pixel).
 * @param height the height of the surface to create (in pixel).
 * @param alphaMask request creation of an alpha mask. Only the alpha channel
 *  is relevant. The actual red, green and blue channel values are given by
 *  the blend color.
 *
 * @return the identifier of the created surface.
 *
 * @since 1.4
 */
- (uint32_t)createOffscreenRenderSurfaceWithWidth:(int)width height:(int)height alphaMask:(BOOL)alphaMask;

/**
 * Requests the release of the offscreen render surface associated with a given
 * identifier.
 *
 * @param surfaceId the identifier of the surface to release.
 *
 * @since 1.4
 */
- (void)releaseOffscreenRenderSurface:(uint32_t)surfaceId;

/**
 * Creates a Canvas that draws onto the offscreen render surface associated with a given identifier.
 *
 * @param surfaceId the identifier of the surface to be drawn.
 *
 * @return a Canvas to draw on the requested surface.
 *
 * @since 1.4
 */
- (nonnull id<IINKICanvas>)createOffscreenRenderCanvas:(uint32_t)surfaceId;

- (void)releaseOffscreenRenderCanvas:(nonnull id<IINKICanvas>)canvas;

@end
