// Copyright MyScript. All right reserved.

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import <iink/graphics/IINKIPath.h>


/**
 * Defines how the ends of segments are drawn.
 */
typedef NS_ENUM(NSUInteger, IINKLineCap) {
  /** Butt end style. */
  IINKLineCapButt,
  /** Round end style. */
  IINKLineCapRound,
  /** Square end style. */
  IINKLineCapSquare
};

/**
 * Defines how the joins between connected segments are drawn.
 */
typedef NS_ENUM(NSUInteger, IINKLineJoin) {
  /** Miter join style. */
  IINKLineJoinMiter,
  /** Round join style. */
  IINKLineJoinRound,
  /** Bevel join style. */
  IINKLineJoinBevel
};

/**
 * Defines the methods used to fill paths and polygons.
 */
typedef NS_ENUM(NSUInteger, IINKFillRule) {
  /** Non-zero fill rule. */
  IINKFillRuleNonZero,
  /** Even-odd fill rule. */
  IINKFillRuleEvenOdd
};

/**
 * The ICanvas interface receives drawing commands.
 */
@protocol IINKICanvas <NSObject>

@required

/**
 * The current transform.
 */
- (CGAffineTransform)getTransform;

- (void)setTransform:(CGAffineTransform)transform;

//==============================================================================
#pragma mark - Stroking Properties
//==============================================================================

/**
 * Sets the stroke color.
 *
 * @param color the stroke color.
 */
- (void)setStrokeColor:(uint32_t)color;

/**
 * Sets the stroke width.
 *
 * @param width the stroke width.
 */
- (void)setStrokeWidth:(float)width;

/**
 * Sets the stroke line cap.
 *
 * @param lineCap the stroke line cap.
 */
- (void)setStrokeLineCap:(IINKLineCap)lineCap;

/**
 * Sets the stroke line join.
 *
 * @param lineJoin the stroke line join.
 */
- (void)setStrokeLineJoin:(IINKLineJoin)lineJoin;

/**
 * Sets the stroke miter limit.
 *
 * @param limit the stroke miter limit.
 */
- (void)setStrokeMiterLimit:(float)limit;
  
/**
 * Sets the pattern of dashes and gaps used to stroke paths.
 *
 * @param array the vector describing the dashes pattern.
 * @param size the size of `arrray`.
 */
- (void)setStrokeDashArray:(nullable const float *)array size:(size_t)size;
  
/**
 * Sets the distance into the dash pattern to start the dash.
 *
 * @param offset the dash offset.
 */
- (void)setStrokeDashOffset:(float)offset;


//==============================================================================
#pragma mark - Filling Properties
//==============================================================================

/**
 * Sets the fill color.
 *
 * @param color the fill color.
 */
- (void)setFillColor:(uint32_t)color;
  
/**
 * Sets the fill rule.
 *
 * @param rule the fill rule.
 */
- (void)setFillRule:(IINKFillRule)rule;


//==============================================================================
#pragma mark - Font Properties
//==============================================================================

/**
 * Sets the font properties.
 *
 * @param family the font family.
 * @param lineHeight the font line height.
 * @param size the font size.
 * @param style the font style.
 * @param variant the font variant.
 * @param weight the font weight.
 */
- (void)setFontProperties:(nonnull NSString *)family
                   height:(float)lineHeight size:(float)size
                    style:(nonnull NSString *)style variant:(nonnull NSString *)variant
                   weight:(int)weight;


//==============================================================================
#pragma mark - Group Management
//==============================================================================

/**
 * Indicates that the drawing of a group of items starts.
 *
 * @param identifier the identifier of the group.
 * @param region the region coordinates of the group box.
 * @param clipContent `true` if the canvas should use the group box as the
 *   clipping region until corresponding endGroup(), otherwise `false`.
 */
- (void)startGroup:(nonnull NSString *)identifier region:(CGRect)region clip:(BOOL)clipContent;

/**
 * Indicates that the drawing of a group of items ends.
 *
 * @param identifier the identifier of the group.
 */
- (void)endGroup:(nonnull NSString *)identifier;

/**
 * Indicates that the drawing of an item starts.
 *
 * @param identifier the identifier of the group.
 */
- (void)startItem:(nonnull NSString *)identifier;

/**
 * Indicates that the drawing of an item ends.
 *
 * @param identifier the identifier of the group.
 */
- (void)endItem:(nonnull NSString *)identifier;


//==============================================================================
#pragma mark - Drawing Commands
//==============================================================================

/**
 * Creates a new general path.
 *
 * @return the newly created general path.
 */
- (nonnull id<IINKIPath>)createPath;

/**
 * Requests drawing of a path.
 *
 * @param path the path to draw.
 */
- (void)drawPath:(_Nonnull id<IINKIPath>)path;

/**
 * Requests drawing of a rectangle.
 *
 * @param rect the rectangle.
 */
- (void)drawRectangle:(CGRect)rect;

/**
 * Requests drawing of a line segment.
 *
 * @param from the first point.
 * @param to the last point.
 */
- (void)drawLine:(CGPoint)from to:(CGPoint)to;

/**
 * Requests drawing of an object.
 *
 * @note the object should be transformed (translation and uniform scale) so
 *   that it fits centered in the specified viewport rectangle.
 *
 * @param url the URL of the object.
 * @param mimeType the Mime type associated with the object.
 * @param rect the coordinates of the viewport rectangle.
 */
- (void)drawObject:(nonnull NSString *)url mimeType:(nonnull NSString*)mimeType region:(CGRect)rect;

/**
 * Requests drawing of text.
 *
 * @note the extent of the rendered text as given by xmin, ymin, xmax, and
 *   ymax is informative and should not be used for the actual rendering.
 *
 * @param label the label of the text to draw.
 * @param origin the coordinate of the position from where to draw the text.
 * @param rect extent of the rendered text.
 */
- (void)drawText:(nonnull NSString *)label anchor:(CGPoint)origin region:(CGRect)rect;

@end
