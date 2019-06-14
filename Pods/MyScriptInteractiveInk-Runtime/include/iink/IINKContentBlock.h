// Copyright MyScript. All right reserved.

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>


@class IINKContentPart;

/**
 * Describes the state of the content for a given block.
 */
typedef NS_OPTIONS(NSUInteger, IINKConversionState)
{
  /** Handwritten content (ink). */
  IINKConversionStateHandwriting = 1 << 0,
  /** Digital content, suitable for publication (adaptative font size, fitted graphics). */
  IINKConversionStateDigitalPublish = 1 << 1,
  /** Digital content, suitable for edition (normalized font size, expanded graphics). */
  IINKConversionStateDigitalEdit = 1 << 2
};

/**
 * Wrapper object for an `IINKConversionState` value.
 */
@interface IINKConversionStateValue : NSObject
{

}

@property (nonatomic) IINKConversionState value;

/**
 * Create a new `ConversionStateValue` instance.
 * @param value the conversion state value.
 */
- (nullable instancetype)initWithValue:(IINKConversionState)value;

/**
 * Builds a new `ConversionStateValue` instance.
 * @param value the conversion state value.
 */
+ (nonnull IINKConversionStateValue *)valueWithConversionState:(IINKConversionState)value;

@end

/**
 * Represents a block of content. The tree of content blocks provides the
 * hierarchical structure of a content part into semantic units.
 */
@interface IINKContentBlock : NSObject
{

}

//==============================================================================
#pragma mark - Properties
//==============================================================================

/**
 * The part that contains this block.
 */
@property (nonatomic, readonly, nonnull) IINKContentPart *part;

/**
 * Whether this block is still valid. A block becomes invalid when it is
 * removed or when the currently edited part changes (see
 * {@link IINKEditorDelegate#partChanged}).
 */
@property (nonatomic, readonly) BOOL valid;

/**
 * The type of this block.
 */
@property (nonatomic, readonly, nonnull) NSString *type;

/**
 * The identifier of this block.
 */
@property (nonatomic, readonly, nonnull) NSString *identifier;

/**
 * An identifier that can be used to match corresponding calls to
 * {@link IINKICanvas#startGroup}.
 */
@property (nonatomic, readonly, nonnull) NSString *renderingIdentifier;

/**
 * The box that represents the position of this block.
 */
@property (nonatomic, readonly) CGRect box;

/**
 * The children of this block. The returned array is a copy of the
 * list of child blocks, which makes it safe against concurrent changes.
 */
@property (nonatomic, readonly, nonnull) NSArray<IINKContentBlock *> *children;

/**
 * The current conversion state of this block as a bitwise or combination
 * IINKConversionState values.
 */
@property (nonatomic, readonly) IINKConversionState conversionState;

/**
 * The block's attributes as a JSON string.
 *
 * @since 1.1
 */
@property (nonatomic, readonly, nonnull) NSString *attributes;

@end
